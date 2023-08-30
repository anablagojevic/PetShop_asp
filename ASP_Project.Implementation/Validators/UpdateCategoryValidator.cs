
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
    public class UpdateCategoryValidator : AbstractValidator<UpdateCategoryDto>
    {
        private ProjectDbContext _context;
        public UpdateCategoryValidator(ProjectDbContext context)
        {
            _context = context;
            RuleFor(x => x.Data.Name).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the category name.")
                                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                                .Must(CategoryNotInUse).WithMessage("Category {PropertyValue} already exist.");

            RuleFor(x => x.Data.ParentCategoryId).Must(x => context.Categories.Any(c => c.Id == x && c.IsActive))
                                            .When(x => x.Data.ParentCategoryId.HasValue)
                                            .WithMessage("Parent category doesn`t exist.");
        }

        private bool CategoryNotInUse(string name)
        {
            return !_context.Categories.Any(x => x.Name == name);
        }
    }
}
