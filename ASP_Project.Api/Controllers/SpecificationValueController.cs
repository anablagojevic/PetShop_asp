using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SpecificationValueController : ControllerBase
    {
        private UseCaseHandler _handler;

        public SpecificationValueController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Adds new specification value.
        /// </summary>
        /// <response code="204">No COntent.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPost]
        public IActionResult Post([FromBody] NewSpecificationValueDto dto, [FromServices] IInsertNewSpecificationValueCommand command)
        {
            _handler.HandleCommand(command, dto);
            return NoContent();
        }
    }
}
