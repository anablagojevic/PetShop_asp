using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Queries.Ef
{
    public class EfFindSpecificationQuery : EfUseCase, IFindSpecificationQuery
    {
        public EfFindSpecificationQuery(ProjectDbContext context) : base(context)
        {
        }

        public int Id => 5;

        public string Name => "Find specification using EF";

        public string Description => "";

        public SpecificationDto Execute(int search)
        {
            var spec = Context.Specifications.Include(x => x.SpecificationValues).FirstOrDefault(x => x.Id == search && x.IsActive);

            if(spec == null)
            {
                throw new EntityNotFoundException(nameof(Specification), search);
            }

            return new SpecificationDto
            {
                Id = spec.Id,
                Name = spec.Name,
                SpecificationValues = spec.SpecificationValues.Select(x => new SpecificationValueDto
                {
                    Id = x.Id,
                    Value = x.Value
                })
            };
        }
    }
}
