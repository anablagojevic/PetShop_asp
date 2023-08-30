using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Domain.Entities
{
    public class Comment : Entity
    {
        public string CommentText { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}
