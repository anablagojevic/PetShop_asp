using ASP_Project.ApplicationLayer.UseCases.DTO;
using Microsoft.AspNetCore.Http;

namespace ASP_Project.Api.DTO
{
    public class CreateProductWithImage : CreateProductDto
    {
        public IFormFile Image { get; set; }
    }

    public class UpdateProductWithImage : UpdateProductDto
    {
        public IFormFile NewImage { get; set; }
    }
}
