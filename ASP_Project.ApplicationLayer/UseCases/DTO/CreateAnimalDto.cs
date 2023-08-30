using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class CreateAnimalDto : BaseDto
    {
        public string Name { get; set; }
        public IEnumerable<int> CategoryIds { get; set; }
    }
}
