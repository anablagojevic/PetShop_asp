using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateCommentCommand : EfUseCase, IUpdateCommentCommand
    {
        private readonly IApplicationUser _currentUser;
        private readonly UpdateCommentValidator _validator;
        public EfUpdateCommentCommand(ProjectDbContext context, IApplicationUser currentUser, UpdateCommentValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 27;

        public string Name => "Update comment using EF";

        public string Description => "";

        public void Execute(UpdateCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var comment = Context.Comments.FirstOrDefault(x => x.Id == request.Id);

            var userId = comment.UserId;

            if (userId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You are not authorized to update this comment.");
            }

            comment.CommentText = request.UpdatedCommentText;

            Context.SaveChanges();
        }
    }
}
