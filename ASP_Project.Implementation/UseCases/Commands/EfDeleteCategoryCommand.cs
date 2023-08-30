
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
   public class EfDeleteCategoryCommand : EfUseCase, IDeleteCategoryCommand
    {
        public EfDeleteCategoryCommand(ProjectDbContext context) : base(context)
        {
        }

        public int Id => 14;

        public string Name => "Delete category using EF";

        public string Description => throw new NotImplementedException();

        public void Execute(int request)
        {
            var cat = Context.Categories.FirstOrDefault(x => x.Id == request);

            if(cat == null)
            {
                throw new EntityNotFoundException(nameof(Category), request);
            }

            if (cat.AnimalCategories.Any())
            {
                throw new UseCaseConflictException("Can't delete category because of it's link to Animals: "
                                                   + string.Join(", ", cat.AnimalCategories.Select(x => x.Animal.Name)));
            }

            Context.Categories.RemoveRange(cat.ChildCategories);
            Context.Categories.Remove(cat);

            Context.SaveChanges();
        }
    }
}
