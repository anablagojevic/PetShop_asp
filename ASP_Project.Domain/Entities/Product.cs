using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Product : Entity
    {
        public string Title { get; set; }
        public int CategoryId { get; set; }
        public string Description { get; set; }
        public virtual ICollection<Image> Images { get; set; } = new List<Image>();
        public virtual ICollection<Price> Prices { get; set; } = new List<Price>();
        public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();
        public virtual ICollection<CartItem> CartItems { get; set; } = new List<CartItem>();
        public virtual Category Category { get; set; }
    }
}
