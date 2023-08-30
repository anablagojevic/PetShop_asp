using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterDto>
    {
        public RegisterUserValidator(ProjectDbContext _context)
        {
            var regex = @"^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{2,15})?$";

            RuleFor(x => x.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Email is not in the right format.")
                .Must(x => !_context.Users.Any(u => u.Email == x)).WithMessage("Email address {PropertyValue} is already in use.");

            RuleFor(x => x.Username)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Username is required.")
                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                .MaximumLength(30).WithMessage("Maximum caracter length is 30.")
                .Matches("^(?=[a-zA-Z0-9._]{3,12}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                .WithMessage("Username is not in the right format.")
                .Must(x => !_context.Users.Any(u => u.Username == x)).WithMessage("Username {PropertyValue} is already in use.");

            RuleFor(x => x.FirstName).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("First name is required.")
                .Matches(regex).WithMessage("First name is not in the right format.");

            RuleFor(x => x.LastName).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Last name in not in the right format.")
                .Matches(regex).WithMessage("Last name is not in the right format.");

            RuleFor(x => x.Password).NotEmpty().WithMessage("Password is required.")
                .Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                .WithMessage("Password must contain at least 8 caracters, one upper and one lower case, a number and a special caracter.");

        }
    }
}
