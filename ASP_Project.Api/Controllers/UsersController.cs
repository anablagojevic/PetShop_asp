using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private UseCaseHandler _handler;
        public UsersController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Searches currently logged in user.
        /// </summary>
        /// <response code="200">Ok.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpGet]
        public IActionResult Get([FromServices] IApplicationUser user)
        {
            return Ok(user);
        }

        /// <summary>
        /// Generates token.
        /// </summary>
        /// <response code="200">Ok.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromServices] IApplicationUser user)
        {
            return Ok(user);
        }

        /// <summary>
        /// Updates user.
        /// </summary>
        /// <response code="200">Ok.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateUserDto updateUserDto, [FromServices] IUpdateUserCommand command)
        {
            var data = new UpdateUserDto
            {
                Id = id,
                FirstName = updateUserDto.FirstName,
                LastName = updateUserDto.LastName,
                NewEmail = updateUserDto.NewEmail,
                NewUsername = updateUserDto.NewUsername,
                NewPassword = updateUserDto.NewPassword,
            };

            _handler.HandleCommand(command, data);
            return NoContent();
        }

        /// <summary>
        /// Deletes a user.
        /// </summary>
        /// <response code="201">No Content.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
