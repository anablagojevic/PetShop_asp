using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateAnimalCommand : EfUseCase, IUpdateAnimalCommand
    {
        private readonly IApplicationUser _currentUser;
        private CreateAnimalValidator _validator;
        public EfUpdateAnimalCommand(ProjectDbContext context, IApplicationUser currentUser, CreateAnimalValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 12;

        public string Name => "Update animal name using EF";

        public string Description => "";

        public void Execute(CreateAnimalDto request)
        {
            _validator.ValidateAndThrow(request);

            var animalCategory = Context.AnimalCategories
                                      .Where(x => x.AnimalId == request.Id)
                                      .ToList();

            Context.AnimalCategories.RemoveRange(animalCategory);

            var animalUpdate = Context.Animals.FirstOrDefault(x => x.Id == request.Id);

            animalUpdate.Name = request.Name;
            animalUpdate.UpdatedBy = _currentUser.Email;

            var animalCategoryIds = request.CategoryIds.Select(x => new AnimalCategory
            {
                CategoryId = x,
                AnimalId = animalUpdate.Id
            });

            Context.AnimalCategories.AddRange(animalCategoryIds);
            Context.SaveChanges();
        }
    }
}
