using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfOrderCartCommand : EfUseCase, IOrderCartCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfOrderCartCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 29;

        public string Name => "Order cart using EF";

        public string Description => "";

        public void Execute(int cartId)
        {
            var cart = Context.Carts.FirstOrDefault(c => c.Id == cartId && c.UserId == _currentUser.Id && c.IsActive);

            if (cart == null)
            {
                throw new EntityNotFoundException(nameof(Cart), cartId);
            }

            if (_currentUser.Id != cart.UserId)
            {
                throw new UnauthorizedAccessException("You don't have permission to create an order for this cart.");
            }

            cart.Status = "Kupljeno";
            cart.IsActive = false;

            Context.SaveChanges();
        }
    }
}
