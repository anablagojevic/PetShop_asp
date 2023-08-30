using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Animal : Entity
    {
        public string Name { get; set; }
        public virtual ICollection<AnimalCategory> AnimalCategories { get; set; } = new List<AnimalCategory>();
    }
}
