using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Linq;
namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfCreateCommentCommand : EfUseCase, ICreateCommentCommand
    {
        private readonly IApplicationUser _currentUser;
        private readonly CommentValidator _validator;
        public EfCreateCommentCommand(ProjectDbContext context, IApplicationUser currentUser, CommentValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 26;

        public string Name => "Create comment using EF";

        public string Description => "";

        public void Execute(CommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var userId = _currentUser.Id;

            var existingProduct = Context.Products.FirstOrDefault(p => p.Id == request.ProductId && p.IsActive);

            if (existingProduct == null)
            {
                throw new EntityNotFoundException(nameof(Product), request.ProductId);
            }

            var comment = new Comment
            {
                CommentText = request.CommentText,
                ProductId = request.ProductId,
                UserId = userId
            };

            Context.Comments.Add(comment);
            Context.SaveChanges();
        }
    }
}
