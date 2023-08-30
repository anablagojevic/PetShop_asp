using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CartController : ControllerBase
    {
        private UseCaseHandler _handler;

        public CartController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        [HttpPost]
        public IActionResult Post([FromBody] CartDto dto, [FromServices] ICreateCartCommand command)
        {
            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CartDto dto, [FromServices] IUpdateCartCommand command)
        {
            var data = new CartDto
            {
                ProductId = dto.ProductId
            };
            _handler.HandleCommand(command, data);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCartCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
