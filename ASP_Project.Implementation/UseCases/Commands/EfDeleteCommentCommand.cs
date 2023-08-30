using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfDeleteCommentCommand : EfUseCase, IDeleteCommentCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteCommentCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 28;

        public string Name => "Delete comment using EF";

        public string Description => "";

        public void Execute(int request)
        {
            var comment = Context.Comments.FirstOrDefault(x => x.Id == request && x.IsActive);

            if (comment == null)
            {
                throw new EntityNotFoundException(nameof(Comment), request);
            }

            var userId = comment.UserId;

            if (userId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to delete this comment.");
            }

            Context.Comments.Remove(comment);
            Context.SaveChanges();
        }
    }
}
