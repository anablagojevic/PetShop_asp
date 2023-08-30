using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfDeleteSpecificationCommand : EfUseCase, IDeleteSpecificationCommand
    {
        public EfDeleteSpecificationCommand(ProjectDbContext context) : base(context)
        {
        }

        public int Id => 7;

        public string Name => "Delete specification";

        public string Description => "";

        public void Execute(int request)
        {
            var spec = Context.Specifications
                        .Include(x => x.SpecificationValues)
                        .FirstOrDefault(x => x.Id == request && x.IsActive);

            if (spec == null)
            {
                throw new EntityNotFoundException(nameof(Specification), request);
            }

            if (spec.CategorySpecifications.Any())
            {
                throw new UseCaseConflictException("Can't delete specification because of it's link to categories: "
                                                   + string.Join(", ", spec.CategorySpecifications.Select(x => x.Category.Name)));
            }

            Context.SpecificationValues.RemoveRange(spec.SpecificationValues);
            Context.Specifications.Remove(spec);

            Context.SaveChanges();
        }
    }
}
