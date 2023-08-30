using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Price : Entity
    {
        public decimal Value { get; set; }
        public DateTime StartedAt { get; set; }
        public DateTime EndedAt { get; set; }
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }
    }
}
