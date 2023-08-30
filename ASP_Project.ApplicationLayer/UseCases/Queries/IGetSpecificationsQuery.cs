using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.Queries
{
    public interface IGetSpecificationsQuery : IQuery<BaseSearch, IEnumerable<SpecificationDto>>
    {

    }
}
