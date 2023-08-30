using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class UserUseCaseLog : Entity
    {
        public string UseCaseName { get; set; }
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Data { get; set; }
        public bool IsAuthorized { get; set; }
    }
}
