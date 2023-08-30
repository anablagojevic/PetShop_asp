using ASP_Project.Api.DTO;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProductController : ControllerBase
    {
        public static IEnumerable<string> AllowedExtensions => new List<string> { ".jpg", ".png", ".jpeg" };

        private UseCaseHandler _handler;
        public ProductController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] IGetProductQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        [HttpPost]
        public IActionResult Post([FromForm] CreateProductWithImage dto, [FromServices] ICreateProductCommand command)
        {
            if (dto.Image != null)
            {
                var guid = Guid.NewGuid().ToString();

                var extension = Path.GetExtension(dto.Image.FileName);

                if (!AllowedExtensions.Contains(extension))
                {
                    throw new InvalidOperationException("Unsupported file type.");
                }

                var fileName = guid + extension;

                var filePath = Path.Combine("wwwroot", "images", fileName);

                using var stream = new FileStream(filePath, FileMode.Create);
                dto.Image.CopyTo(stream);


                dto.ImageFileName = fileName;
            }

            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] UpdateProductWithImage dto, [FromServices] IUpdateProductCommand command)
        {
            if (dto.NewImage != null)
            {
                var guid = Guid.NewGuid().ToString();

                var extension = Path.GetExtension(dto.NewImage.FileName);

                if (!AllowedExtensions.Contains(extension))
                {
                    throw new InvalidOperationException("Unsupported file type.");
                }

                var fileName = guid + extension;

                var filePath = Path.Combine("wwwroot", "images", fileName);

                using var stream = new FileStream(filePath, FileMode.Create);
                dto.NewImage.CopyTo(stream);


                dto.NewImageFileName = fileName;
            }

            var data = new UpdateProductWithImage
            {
                Id = id,
                NewTitle = dto.NewTitle,
                NewDescription = dto.NewDescription,
                NewImageFileName = dto.NewImageFileName,
                NewPriceValue = dto.NewPriceValue,
                NewImage = dto.NewImage
            };

            _handler.HandleCommand(command, data);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteProductCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
