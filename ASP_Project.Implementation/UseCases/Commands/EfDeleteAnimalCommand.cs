
using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfDeleteAnimalCommand : EfUseCase, IDeleteAnimalCommand
    {
        public EfDeleteAnimalCommand(ProjectDbContext context) : base(context)
        {

        }

        public int Id => 11;

        public string Name => "Delete animal name using EF";

        public string Description => "";

        public void Execute(int request)
        {
            var animal = Context.Animals.FirstOrDefault(x => x.Id == request && x.IsActive);

            if (animal == null)
            {
                throw new EntityNotFoundException(nameof(Animal), request);
            }

            if (animal.AnimalCategories.Any())
            {
                throw new UseCaseConflictException("Can't delete animal name because of it's link to categories: "
                                                   + string.Join(", ", animal.AnimalCategories.Select(x => x.Category.Name)));
            }

            Context.Animals.Remove(animal);

            Context.SaveChanges();
        }
    }
}
