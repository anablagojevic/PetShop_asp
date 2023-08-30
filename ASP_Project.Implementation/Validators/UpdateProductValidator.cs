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
    public class UpdateProductValidator : AbstractValidator<UpdateProductDto>
    {
        private ProjectDbContext _context;
        public UpdateProductValidator(ProjectDbContext context)
        {
            _context = context;

            RuleFor(x => x.NewTitle).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the product title.")
                                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                                .Must(BeUniqueProductTitle).WithMessage("Product title {PropertyValue} already exist.");

            RuleFor(x => x.NewDescription).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the product description.")
                                .MinimumLength(10).WithMessage("Minimum caracter length is 10.");
        }

        private bool BeUniqueProductTitle(UpdateProductDto dto, string newTitle)
        {
            return !_context.Products.Any(u => u.Title == newTitle) || newTitle == dto.NewTitle;
        }
    }
}
