using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class UpdateUserDto : BaseDto
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NewEmail { get; set; }
        public string NewUsername { get; set; }
        public string NewPassword { get; set; }
    }
}
