
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
    public class UpdateUserUseCasesValidator : AbstractValidator<UpdateUserUseCasesDto>
    {
        public UpdateUserUseCasesValidator(ProjectDbContext context)
        {
            RuleFor(x => x.UserId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("User is required.")
                .Must(x => context.Users.Any(u => u.Id == x)).WithMessage("User doesn't exist.");

            RuleFor(x => x.UseCaseIds)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Use cases are required.")
                .Must(x => x.Count() == x.Distinct().Count()).WithMessage("It is not allowed to duplicate values.");

        }
    }
}
