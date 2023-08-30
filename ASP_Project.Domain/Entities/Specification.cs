using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Specification : Entity
    {
        public string Name { get; set; }
        public virtual ICollection<CategorySpecification> CategorySpecifications { get; set; } = new List<CategorySpecification>();
        public virtual ICollection<SpecificationValue> SpecificationValues { get; set; }
    }
}
