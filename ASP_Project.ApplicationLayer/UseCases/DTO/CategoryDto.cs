using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class CategoryDto : BaseDto //za pretragu
    {
        public string Name { get; set; }
    }

    public class CreateCategoryDto
    {
        public string Name { get; set; }
        public int? ParentCategoryId { get; set; }
    }

    public class UpdateCategoryDto : BaseDto
    {
        public CreateCategoryDto Data { get; set; }
    }
}
