
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfCreateCategoryCommand : EfUseCase, ICreateCategoryCommand
    {
        private CreateCategoryValidator _validator;
        public EfCreateCategoryCommand(
                ProjectDbContext context, 
                CreateCategoryValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 2;

        public string Name => "Create Category";

        public string Description => "Create category using entity framework";

        public void Execute(CreateCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = new Category
            {
                Name = request.Name,
                ParentId = request.ParentCategoryId
            };

            Context.Categories.Add(category);
            Context.SaveChanges();
        }
    }
}
