
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
    public class UserUseCasesController : ControllerBase
    {
        private UseCaseHandler _handler;

        public UserUseCasesController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Updates user use cases.
        /// </summary>
        /// <response code="201">No Content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPut]
        public IActionResult Put(
            [FromBody] UpdateUserUseCasesDto request,
            [FromServices] IUpdateUserUseCasesCommand command)
        {
            _handler.HandleCommand(command, request);
            return NoContent();
        }
    }
}
