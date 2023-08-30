using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.Validators
{
    public class UpdateUserValidator : AbstractValidator<UpdateUserDto>
    {
        private readonly ProjectDbContext _context;
        public UpdateUserValidator(ProjectDbContext context)
        {
            _context = context;

            var regex = @"^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{2,15})?$";

            RuleFor(x => x.NewEmail)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Email is not in the right format.")
                .Must(BeUniqueEmail)
                .WithMessage("Email address {PropertyValue} is already in use.");


            RuleFor(x => x.NewUsername)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Username is required.")
                .MinimumLength(3).WithMessage("Minimum caracter length is 3.")
                .MaximumLength(30).WithMessage("Maximum caracter length is 30.")
                .Matches("^(?=[a-zA-Z0-9._]{3,12}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                .WithMessage("Username is not in the right format.")
                .Must(BeUniqueUsername)
                .WithMessage("Username {PropertyValue} is already in use.");

            RuleFor(x => x.FirstName).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("First name is required.")
                .Matches(regex).WithMessage("First name is not in the right format.");

            RuleFor(x => x.LastName).Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Last name in not in the right format.")
                .Matches(regex).WithMessage("Last name is not in the right format.");

            RuleFor(x => x.NewPassword).NotEmpty().WithMessage("Password is required.")
                .Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                .WithMessage("Password must contain at least 8 caracters, one upper and one lower case, a number and a special caracter.");

        }

        private bool BeUniqueEmail(UpdateUserDto dto, string newEmail)
        {
            return !_context.Users.Any(u => u.Email == newEmail) || newEmail == dto.NewEmail;
        }

        private bool BeUniqueUsername(UpdateUserDto dto, string newUsername)
        {
            return !_context.Users.Any(u => u.Username == newUsername) || newUsername == dto.NewUsername;
        }
    }
}
