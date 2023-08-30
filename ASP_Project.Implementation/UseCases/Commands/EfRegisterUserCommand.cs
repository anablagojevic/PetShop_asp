
using ASP_Project.ApplicationLayer.Emails;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfRegisterUserCommand : EfUseCase, IRegisterUserCommand
    {
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
            _sender.Send(new EmailDto
            {
                To = request.Email,
                Title = "Successfull registration!",
                Body = "Dear " + request.Username + "\n Please activate your account."
            });
        }

        public int Id => 3;

        public string Name => "User registration";

        public string Description => "Registration using entity framework";
    }
}
