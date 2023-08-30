using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateCategoryCommand : EfUseCase, IUpdateCategoryCommand
    {
        private readonly IApplicationUser _currentUser;
        private UpdateCategoryValidator _validator;
        public EfUpdateCategoryCommand(ProjectDbContext context, IApplicationUser currentUser, UpdateCategoryValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 13;

        public string Name => "Update category using EF";

        public string Description => "";

        public void Execute(UpdateCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = Context.Categories.FirstOrDefault(x => x.Id == request.Id);   

            category.Name = request.Data.Name;
            category.UpdatedBy = _currentUser.Email;

            Context.SaveChanges();
        }
    }
}
