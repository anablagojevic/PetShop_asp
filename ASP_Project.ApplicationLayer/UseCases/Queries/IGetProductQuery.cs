using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using System.Collections.Generic;

namespace ASP_Project.ApplicationLayer.UseCases.Queries
{
    public interface IGetProductQuery : IQuery<BaseSearch, IEnumerable<ProductDto>>
    {

    }
}
