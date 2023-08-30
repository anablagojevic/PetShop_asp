using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class CommentDto
    {
        public int ProductId { get; set; }
        public string CommentText { get; set; }
    }

    public class UpdateCommentDto : BaseDto
    {
        public string UpdatedCommentText { get; set; }
    }
}
