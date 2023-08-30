using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.Validators
{
    public class CommentValidator : AbstractValidator<CommentDto>
    {
        private ProjectDbContext _context;
        public CommentValidator(ProjectDbContext context)
        {
            _context = context;

            RuleFor(x => x.CommentText).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter your comment.")
                                .MaximumLength(300).WithMessage("Maximum caracter length is 300.");
        }
    }

    public class UpdateCommentValidator : AbstractValidator<UpdateCommentDto>
    {
        private ProjectDbContext _context;
        public UpdateCommentValidator(ProjectDbContext context)
        {
            _context = context;

            RuleFor(x => x.UpdatedCommentText).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter your comment.")
                                .MaximumLength(300).WithMessage("Maximum caracter length is 300.");
        }
    }
}
