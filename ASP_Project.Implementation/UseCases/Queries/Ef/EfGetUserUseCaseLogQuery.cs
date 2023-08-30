using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Queries.Ef
{
    public class EfGetUserUseCaseLogQuery : EfUseCase, IGetUserUseCaseLog
    {
        public EfGetUserUseCaseLogQuery(ProjectDbContext context) : base(context)
        {
        }

        public int Id => 15;

        public string Name => "Search user use case logs using EF";

        public string Description => "";

        public IEnumerable<UserUseCaseLogDto> Execute(UserUseCaseLogSearch search)
        {
            var query = Context.UserUseCaseLogs.Where(x => x.IsActive);

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                query = query.Where(x => x.UseCaseName.Contains(search.Keyword));
            }

            if (!string.IsNullOrEmpty(search.Username))
            {
                query = query.Where(x => x.Username == search.Username);
            }

            if (search.FromDate.HasValue)
            {
                query = query.Where(x => x.CreatedAt >= search.FromDate.Value);
            }

            if (search.ToDate.HasValue)
            {
                query = query.Where(x => x.CreatedAt <= search.ToDate.Value);
            }

            return query.Select(x => new UserUseCaseLogDto
            {
                Id = x.Id,
                UseCaseName = x.UseCaseName
            }).ToList();
        }
    }
}
