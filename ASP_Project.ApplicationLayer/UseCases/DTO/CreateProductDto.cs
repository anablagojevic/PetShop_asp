using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class ProductDto : BaseDto
    {
        public string Title { get; set; }
    }

    public class CreateProductDto
    {
        public string Title { get; set; }
        public int CategoryId { get; set; }
        public string Description { get; set; }
        public string ImageFileName { get; set; }
        public decimal PriceValue { get; set; }
    }

    public class UpdateProductDto : BaseDto
    {
        public string NewTitle { get; set; }
        public string NewDescription { get; set; }
        public string NewImageFileName { get; set; }
        public decimal NewPriceValue { get; set; }
    }
}
