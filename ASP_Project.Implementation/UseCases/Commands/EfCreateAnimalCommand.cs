
using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfCreateAnimalCommand : EfUseCase, ICreateAnimalCommand
    {
        private CreateAnimalValidator _validator;
        public EfCreateAnimalCommand(ProjectDbContext context, CreateAnimalValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 9;

        public string Name => "Create Animal using EF";

        public string Description => "";

        public void Execute(CreateAnimalDto request)
        {
            _validator.ValidateAndThrow(request);

            var animal = new Animal
            {
                Name = request.Name
            };

            Context.Animals.Add(animal);
            Context.SaveChanges();

            var animalCategory = request.CategoryIds.Select(x => new AnimalCategory
            {
                CategoryId = x,
                AnimalId = animal.Id
            });

            Context.AnimalCategories.AddRange(animalCategory);
            Context.SaveChanges();
        }
    }
}
