using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class UserUseCaseLogDto : BaseDto
    {
        public string UseCaseName { get; set; }
    }

    public class UserUseCaseLogSearch : BaseSearch
    {
        public string Username { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
    }
}
