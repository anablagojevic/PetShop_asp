
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
    public class CreateAnimalValidator : AbstractValidator<CreateAnimalDto>
    {
        private ProjectDbContext _context;
        public CreateAnimalValidator(ProjectDbContext context)
        {
            _context = context;

            var regex = @"^[A-Z][a-z]{2,15}(\s[a-z]{2,15})?$";

            RuleFor(x => x.Name).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("Please enter the animal name.")
                                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                                .MaximumLength(30).WithMessage("Maximum caracter length is 30.")
                                .Matches(regex).WithMessage("Animal name is not in the right format.")
                                .Must(x => !_context.Animals.Any(u => u.Name == x)).WithMessage("Animal name {PropertyValue} already exist.");
        }
    }
}
