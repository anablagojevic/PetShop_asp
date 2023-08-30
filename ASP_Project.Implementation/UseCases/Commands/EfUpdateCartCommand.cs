using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateCartCommand : EfUseCase, IUpdateCartCommand
    {
        public readonly IApplicationUser _currentUser;
        public EfUpdateCartCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 24;

        public string Name => "Update cart using EF";

        public string Description => "";

        public void Execute(CartDto request)
        {
            var cart = Context.Carts.Include(x => x.CartItems).FirstOrDefault(y => y.UserId == _currentUser.Id && y.IsActive);

            if (cart == null)
            {
                throw new EntityNotFoundException(nameof(Cart), _currentUser.Id);
            }

            if (cart.UserId != _currentUser.Id)
            {
                throw new UnauthorizedAccessException("You don't have permission to modify this cart.");
            }

            var cartItemToRemove = cart.CartItems.FirstOrDefault(x => x.ProductId == request.ProductId && x.IsActive);

            if (cartItemToRemove == null)
            {
                throw new EntityNotFoundException(nameof(CartItem), request.ProductId);
            }

            if (cartItemToRemove.Quantity > 1)
            {
                cartItemToRemove.Quantity--;
            }
            else
            {
                cart.CartItems.Remove(cartItemToRemove);
            }

            cart.TotalValue = CalculateCartTotal(cart);
            Context.SaveChanges();
        }

        private decimal CalculateCartTotal(Cart cart)
        {
            decimal total = 0;

            foreach (var cartItem in cart.CartItems)
            {
                var product = Context.Products
                    .Include(p => p.Prices)
                    .FirstOrDefault(p => p.Id == cartItem.ProductId);

                if (product != null)
                {
                    var activePrice = product.Prices
                        .OrderByDescending(p => p.StartedAt)
                        .FirstOrDefault(p => p.IsActive);

                    if (activePrice != null)
                    {
                        total += activePrice.Value * cartItem.Quantity;
                    }
                }
            }

            return total;
        }
    }
}
