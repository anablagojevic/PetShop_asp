using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Category : Entity
    {
        public string Name { get; set; }
        public int? ParentId { get; set; }
        public virtual ICollection<Category> ChildCategories { get; set; } = new List<Category>();
        public virtual Category ParentCategory { get; set; }
        public virtual ICollection<Product> Products { get; set; } = new List<Product>();
        public virtual ICollection<CategorySpecification> Specifications { get; set; } = new List<CategorySpecification>();
        public virtual ICollection<AnimalCategory> AnimalCategories { get; set; } = new List<AnimalCategory>();
    }
}
