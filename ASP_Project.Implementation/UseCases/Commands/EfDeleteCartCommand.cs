using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfDeleteCartCommand : EfUseCase, IDeleteCartCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteCartCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 25;

        public string Name => "Delete cart using EF";

        public string Description => "";

        public void Execute(int request)
        {
            var cart = Context.Carts.Include(x => x.CartItems)
                .FirstOrDefault(y => y.Id == request && y.UserId == _currentUser.Id && y.IsActive);

            if(cart.UserId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You don't have permission to delete this cart.");
            }

            if (cart == null)
            {
                throw new EntityNotFoundException(nameof(Cart), request);
            }

            foreach (var cartItem in cart.CartItems)
            {
                Context.CartItems.Remove(cartItem);
            }

            cart.TotalValue = 0;
            Context.Carts.Remove(cart);
            Context.SaveChanges();
        }
    }
}
