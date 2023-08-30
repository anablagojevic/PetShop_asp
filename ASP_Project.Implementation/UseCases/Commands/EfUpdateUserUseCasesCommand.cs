using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateUserUseCasesCommand : EfUseCase, IUpdateUserUseCasesCommand
    {
        private readonly IApplicationUser _currentUser;
        private readonly UpdateUserUseCasesValidator _validator;
        public EfUpdateUserUseCasesCommand(ProjectDbContext context, IApplicationUser currentUser, UpdateUserUseCasesValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 8;

        public string Name => "Update user use case";

        public string Description => "";

        public void Execute(UpdateUserUseCasesDto request)
        {
            _validator.ValidateAndThrow(request);

            var userUseCases = Context.UserUseCases
                                      .Where(x => x.UserId == request.UserId)
                                      .ToList();

            Context.UserUseCases.RemoveRange(userUseCases);

            var useCasesToAdd = request.UseCaseIds.Select(x => new UserUseCase
            {
                UseCaseId = x,
                UserId = request.UserId
            });

            Context.AddRange(useCasesToAdd);

            Context.SaveChanges();
        }
    }
}
