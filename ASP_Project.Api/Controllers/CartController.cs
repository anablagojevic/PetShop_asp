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

        /// <summary>
        /// Creates cart for users.
        /// </summary>
        /// <response code="201">Successfully created.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPost]
        public IActionResult Post([FromBody] CartDto dto, [FromServices] ICreateCartCommand command)
        {
            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        /// <summary>
        /// Updates cart, removes one product from cart.
        /// </summary>
        /// <response code="204">No Content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
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

        /// <summary>
        /// Creates an order for users.
        /// </summary>
        /// <response code="204">No Content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPatch("{id}")]
        public IActionResult Order(int id, [FromServices] IOrderCartCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }

        /// <summary>
        /// Deletes the entire cart.
        /// </summary>
        /// <response code="204">No Content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCartCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
