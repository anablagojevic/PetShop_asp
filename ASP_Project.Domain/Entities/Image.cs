using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Image : Entity
    {
        public string Path { get; set; }
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }
    }
}
