
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class RegisterController : ControllerBase
    {
        private readonly UseCaseHandler _handler;
        private readonly IRegisterUserCommand _command;

        public RegisterController(UseCaseHandler handler, IRegisterUserCommand command)
        {
            _handler = handler;
            _command = command;
        }

        /// <summary>
        /// Registers user.
        /// </summary>
        /// <response code="201">Successfully created.</response>
        /// <response code="422">Validation failure.</response>
        /// <response code="500">Unexpected server error.</response>
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromBody] RegisterDto dto)
        {
            _handler.HandleCommand(_command, dto);
            return StatusCode(StatusCodes.Status201Created);
        } 
    }
}
