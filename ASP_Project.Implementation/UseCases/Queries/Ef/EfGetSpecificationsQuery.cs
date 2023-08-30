
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.UseCases.Queries.Ef
{
    public class EfGetSpecificationsQuery : EfUseCase, IGetSpecificationsQuery
    {
        public EfGetSpecificationsQuery(ProjectDbContext context) : base(context)
        {

        }

        public int Id => 4;

        public string Name => "Search specifications using ef";

        public string Description => "";

        public IEnumerable<SpecificationDto> Execute(BaseSearch search)
        {
            var query = Context.Specifications.Where(x => x.IsActive);

            var kw = search.Keyword;

            if (!string.IsNullOrEmpty(kw))
            {
                query = query.Where(x => x.Name.Contains(kw) || x.SpecificationValues.Any(sv => sv.Value.Contains(kw)));
            }

            return query.Select(x => new SpecificationDto
            {
                Id = x.Id,
                Name = x.Name,
                SpecificationValues = x.SpecificationValues.Where(x => x.IsActive).Select(sv => new SpecificationValueDto
                {
                    Id = sv.Id,
                    Value = sv.Value
                })
            }).ToList();
        }
    }
}
