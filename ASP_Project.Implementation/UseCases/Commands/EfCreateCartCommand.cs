using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfCreateCartCommand : EfUseCase, ICreateCartCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfCreateCartCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 23;

        public string Name => "Create cart using EF";

        public string Description => "";

        public void Execute(CartDto request)
        {
            var userId = _currentUser.Id;

            var cart = Context.Carts.Include(x => x.CartItems).FirstOrDefault(x => x.UserId == userId && x.IsActive);

            if (cart == null)
            {
                cart = new Cart
                {
                    UserId = userId
                };
                Context.Carts.Add(cart);
            }

            var existingProduct = Context.Products.FirstOrDefault(p => p.Id == request.ProductId && p.IsActive);

            if (existingProduct == null)
            {
                throw new EntityNotFoundException(nameof(Product), request.ProductId);
            }

            var existingCartItem = cart.CartItems.FirstOrDefault(p => p.ProductId == request.ProductId && p.IsActive);

            if (existingCartItem == null)
            {
                cart.CartItems.Add(new CartItem
                {
                    ProductId = request.ProductId,
                    Quantity = 1
                });
            }
            else
            {
                existingCartItem.Quantity++;
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
                    .FirstOrDefault(p => p.Id == cartItem.ProductId && p.IsActive);

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
