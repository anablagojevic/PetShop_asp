
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.DataAccess;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Queries.Ef
{
    public class EfGetCategoriesQuery : EfUseCase, IGetCategoriesQuery
    {
        public int Id => 1;

        public string Name => "Categories search";

        public string Description => "Search categories using Entity Framework";

        public EfGetCategoriesQuery(ProjectDbContext context) : base(context)
        {

        }

        public PageResponse<CategoryDto> Execute(BasePageSearch search)
        {
            var query = Context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                query = query.Where(x => x.Name.Contains(search.Keyword));
            }

            if (search.PerPage == null || search.PerPage < 1)
            {
                search.PerPage = 15;
            }

            if (search.Page == null || search.Page < 1)
            {
                search.PerPage = 1;
            }

            var toSkip = (search.Page.Value - 1) * search.PerPage.Value;

            var response = new PageResponse<CategoryDto>();
            response.TotalCount = query.Count();
            response.Data = query.Skip(toSkip).Take(search.PerPage.Value).Select(x => new CategoryDto
            {
                Name = x.Name,
                Id = x.Id
            }).ToList();
            response.CurrentPage = search.Page.Value;
            response.ItemsPerPage = search.PerPage.Value;

            return response;
        }
    }
}
