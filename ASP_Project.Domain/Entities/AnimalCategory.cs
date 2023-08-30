using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class AnimalCategory
    {
        public int CategoryId { get; set; }
        public int AnimalId { get; set; }
        public virtual Category Category { get; set; }
        public virtual Animal Animal { get; set; }
    }
}
