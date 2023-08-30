using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateUserCommand : EfUseCase, IUpdateUserCommand
    {
        private UpdateUserValidator _validator;
        private readonly IApplicationUser _currentUser;
        public EfUpdateUserCommand(ProjectDbContext context, IApplicationUser currentUser, UpdateUserValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 16;

        public string Name => "Update user credentials using EF.";

        public string Description => "";

        public void Execute(UpdateUserDto request)
        {
            var userId = request.Id;

            if (userId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to update this user.");
            }

            var user = Context.Users.Find(userId);

            if (user == null)
            {
                throw new UserNotFoundException(userId);
            }

            _validator.ValidateAndThrow(request);

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.Email = request.NewEmail;
            user.Username = request.NewUsername;

            var hashedPassword = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);
            user.Password = hashedPassword;

            Context.SaveChanges();
        }
    }
}
