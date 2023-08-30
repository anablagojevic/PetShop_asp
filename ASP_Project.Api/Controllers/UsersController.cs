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

        [HttpGet]
        public IActionResult Get([FromServices] IApplicationUser user)
        {
            return Ok(user);
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromServices] IApplicationUser user)
        {
            return Ok(user);
        }

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

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
