
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.DTO.Searches;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AnimalController : ControllerBase
    {
        private UseCaseHandler _handler;

        public AnimalController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] IGetAnimalsQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        [HttpPost]
        public IActionResult Post([FromBody] CreateAnimalDto dto, [FromServices] ICreateAnimalCommand command)
        {
            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteAnimalCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CreateAnimalDto request, [FromServices] IUpdateAnimalCommand command)
        {
            var data = new CreateAnimalDto
            {
                Id = id,
                Name = request.Name,
                CategoryIds = request.CategoryIds,
            };

            _handler.HandleCommand(command, data);
            return NoContent();
        }
    }
}
