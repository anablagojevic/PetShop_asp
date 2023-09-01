
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
    public class SpecificationsController : ControllerBase
    {
        private UseCaseHandler _handler;

        public SpecificationsController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Searches a specification by name.
        /// </summary>
        /// <response code="200">Ok.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        // GET: api/<SpecificationsController>
        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] IGetSpecificationsQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Searches a specification by ID.
        /// </summary>
        /// <response code="200">Ok.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        // GET api/<SpecificationsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IFindSpecificationQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a new specification.
        /// </summary>
        /// <response code="201">No Content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        //// POST api/<SpecificationsController>
        [HttpPost]
        public IActionResult Post([FromBody] CreateSpecificationDto dto, [FromServices] ICreateSpecificationCommand command)
        {
            _handler.HandleCommand(command, dto);
            return NoContent();
        }

        /// <summary>
        /// Deletes specification.
        /// </summary>
        /// <response code="201">No content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        //// DELETE api/<SpecificationsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteSpecificationCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
