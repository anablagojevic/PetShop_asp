
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
    public class CreateSpecificationValidator : AbstractValidator<CreateSpecificationDto>
    {
        public CreateSpecificationValidator(ProjectDbContext context)
        {
            RuleFor(x => x.Name).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Specification name is required.")
                .MinimumLength(3).WithMessage("Minimal number of characters is 3.")
                .Must(name => !context.Specifications.Any(s => s.Name == name && s.IsActive))
                .WithMessage("Specification {PropertyValue} already exist");

            RuleFor(x => x.Values).Cascade(CascadeMode.Stop)
                .Must(x => x.Count() > 1)
                .WithMessage("Minimum number of values is 2.").When(x => x.Values != null && x.Values.Any())
                .Must(values =>
                {
                    if (values == null)
                    {
                        return true;
                    }

                    return values.Distinct().Count() == values.Count();
                }).WithMessage("It is not allowed to duplicate values.").DependentRules(() =>
                {
                    RuleForEach(x => x.Values).NotEmpty().WithMessage("Value should not be empty.");
                });


        }
    }
}
