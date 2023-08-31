
using ASP_Project.ApplicationLayer.Emails;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Collections.Generic;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfRegisterUserCommand : EfUseCase, IRegisterUserCommand
    {
        public IEnumerable<int> AdminUseCases => new List<int> { 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                                                                    19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29 };
        public IEnumerable<int> UserUseCases => new List<int> { 1, 4, 10, 16, 17, 23, 24, 25, 26, 28, 27, 29 };

        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        public EfRegisterUserCommand(ProjectDbContext context, RegisterUserValidator validator, IEmailSender sender) : base(context)
        {
            _validator = validator;
            _sender = sender;
        }

        public void Execute(RegisterDto request)
        {
            //validacija
            _validator.ValidateAndThrow(request);

            var hash = BCrypt.Net.BCrypt.HashPassword(request.Password);

            //upis u bazu
            var userEntity = new User
            {
                Email = request.Email,
                Username = request.Username,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Password = hash
            };

            Context.Users.Add(userEntity);
            Context.SaveChanges();

            //slanje mejla
            //_sender.Send(new EmailDto
            //{
            //    To = request.Email,
            //    Title = "Successfull registration!",
            //    Body = "Dear " + request.Username + "\n Please activate your account."
            //});

            if(!Context.Users.Any())
            {
                var useCasesToAdd = AdminUseCases.Select(x => new UserUseCase
                {
                    UseCaseId = x,
                    UserId = userEntity.Id
                });
                Context.AddRange(useCasesToAdd);
                Context.SaveChanges();
            }
            else
            {
                var useCasesToAdd = UserUseCases.Select(x => new UserUseCase
                {
                    UseCaseId = x,
                    UserId = userEntity.Id
                });
                Context.AddRange(useCasesToAdd);
                Context.SaveChanges();
            }
        }

        public int Id => 3;

        public string Name => "User registration";

        public string Description => "Registration using entity framework";
    }
}
