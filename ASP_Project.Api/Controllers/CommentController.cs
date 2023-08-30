using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ASP_Project.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CommentController : ControllerBase
    {
        private UseCaseHandler _handler;

        public CommentController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        [HttpPost]
        public IActionResult Post([FromBody] CommentDto dto, [FromServices] ICreateCommentCommand command)
        {
            _handler.HandleCommand(command, dto);
            return StatusCode(201);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateCommentDto request, [FromServices] IUpdateCommentCommand command)
        {
            var data = new UpdateCommentDto
            {
                Id = id,
                UpdatedCommentText = request.UpdatedCommentText
            };

            _handler.HandleCommand(command, data);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCommentCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
