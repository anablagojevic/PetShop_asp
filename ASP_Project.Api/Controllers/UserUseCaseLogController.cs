using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.ApplicationLayer.UseCases.Queries;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserUseCaseLogController : ControllerBase
    {
        private UseCaseHandler _handler;

        public UserUseCaseLogController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Searches use case logs.
        /// </summary>
        /// <response code="200">Ok.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        // GET: api/<UserUseCaseLogController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserUseCaseLogSearch search, [FromServices] IGetUserUseCaseLog query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }
    }
}
