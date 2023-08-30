using ASP_Project.ApplicationLayer.UseCases.DTO;
using System.Collections.Generic;

namespace ASP_Project.ApplicationLayer.UseCases.Queries
{
    public interface IGetUserUseCaseLog : IQuery<UserUseCaseLogSearch, IEnumerable<UserUseCaseLogDto>>
    {

    }
}
