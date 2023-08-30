
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Queries.Ef
{
    public class EfGetAnimalsQuery : EfUseCase, IGetAnimalsQuery
    {
        public EfGetAnimalsQuery(ProjectDbContext context) : base(context)
        {
        }

        public int Id => 10;

        public string Name => "Search animals using EF";

        public string Description => "";

        public IEnumerable<CreateAnimalDto> Execute(BaseSearch search)
        {
            var query = Context.Animals.Where(x => x.IsActive);

            var word = search.Keyword;

            if (!string.IsNullOrEmpty(word))
            {
                query = query.Where(x => x.Name.Contains(word));
            }

            return query.Select(x => new CreateAnimalDto
            {
                Id = x.Id,
                Name = x.Name
            }).ToList();
        }
    }
}
