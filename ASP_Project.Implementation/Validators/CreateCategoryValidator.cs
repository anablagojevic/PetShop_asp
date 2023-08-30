﻿
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
    public class CreateCategoryValidator : AbstractValidator<CreateCategoryDto>
    {
        private ProjectDbContext _context;
        public CreateCategoryValidator(ProjectDbContext context)
        {
            _context = context;
            RuleFor(x => x.Name).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the category name.")
                                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                                .Must(CategoryNotInUse).WithMessage("Category {PropertyValue} already exist.");

            RuleFor(x => x.ParentCategoryId).Must(x => context.Categories.Any(c => c.Id == x && c.IsActive))
                                            .When(x => x.ParentCategoryId.HasValue)
                                            .WithMessage("Parent category doesn`t exist.");
        }

        private bool CategoryNotInUse(string name)
        {
            return !_context.Categories.Any(x => x.Name == name);
        }
    }
}
