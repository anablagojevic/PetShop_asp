using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class SpecificationValue : Entity
    {
        public string Value { get; set; }
        public int SpecificationId { get; set; } 
        public virtual Specification Specification { get; set; }
    }
}
