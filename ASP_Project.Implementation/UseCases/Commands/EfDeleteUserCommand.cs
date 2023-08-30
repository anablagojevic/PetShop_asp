using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfDeleteUserCommand : EfUseCase, IDeleteUserCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteUserCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 17;

        public string Name => "Delete user using EF";

        public string Description => "";

        public void Execute(int request)
        {
            var userId = _currentUser.Id;

            if (userId != request)
            {
                throw new UnauthorizedAccessException("You are not authorized to delete this user.");
            }

            var user = Context.Users.Find(userId);

            if (user == null)
            {
                throw new UserNotFoundException(userId);
            }

            Context.Users.Remove(user);
            Context.SaveChanges();
        }
    }
}
