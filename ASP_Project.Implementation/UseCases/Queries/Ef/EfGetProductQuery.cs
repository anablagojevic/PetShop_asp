using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Queries.Ef
{
    public class EfGetProductQuery : EfUseCase, IGetProductQuery
    {
        public EfGetProductQuery(ProjectDbContext context) : base(context)
        {
        }

        public int Id => 21;

        public string Name => "Search product by title using EF";

        public string Description => "";

        public IEnumerable<ProductDto> Execute(BaseSearch search)
        {
            var query = Context.Products.Where(x => x.IsActive);

            var word = search.Keyword;

            if (!string.IsNullOrEmpty(word))
            {
                query = query.Where(x => x.Title.Contains(word));
            }

            return query.Select(x => new ProductDto
            {
                Id = x.Id,
                Title = x.Title
            }).ToList();
        }
    }
}
