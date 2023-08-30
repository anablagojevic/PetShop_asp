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
    public class CreateProductValidator : AbstractValidator<CreateProductDto>
    {
        private ProjectDbContext _context;
        public CreateProductValidator(ProjectDbContext context)
        {
            _context = context;

            RuleFor(x => x.Title).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the product title.")
                                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                                .Must(ProductTitleNotInUse).WithMessage("Product title {PropertyValue} already exist.");
            RuleFor(x => x.Description).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the product description.")
                                .MinimumLength(10).WithMessage("Minimum caracter length is 10.");
        }

        private bool ProductTitleNotInUse(string name)
        {
            return !_context.Products.Any(x => x.Title == name);
        }
    }
}
