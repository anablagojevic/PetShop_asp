using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfDeleteProductCommand : EfUseCase, IDeleteProductCommand
    {
        private readonly IApplicationUser _currentUser;
        public EfDeleteProductCommand(ProjectDbContext context, IApplicationUser currentUser) : base(context)
        {
            _currentUser = currentUser;
        }

        public int Id => 22;

        public string Name => "Delete product using EF";

        public string Description => "";

        public void Execute(int request)
        {
            var product = Context.Products.FirstOrDefault(x => x.Id == request);

            if (product == null)
            {
                throw new EntityNotFoundException(nameof(Product), request);
            }

            var pricesToDelete = Context.Prices.Where(p => p.ProductId == request);

            Context.Prices.RemoveRange(pricesToDelete);

            var imagesToDelete = Context.Images.Where(i => i.ProductId == request);

            Context.Images.RemoveRange(imagesToDelete);

            Context.Products.Remove(product);

            Context.SaveChanges();

            //foreach (var price in pricesToDelete)
            //{
            //    price.EndedAt = DateTime.UtcNow;
            //    price.DeletedAt = DateTime.UtcNow;
            //    price.DeletedBy = _currentUser.Email;
            //    price.IsActive = false;
            //}
            //Context.Prices.RemoveRange(pricesToDelete);

            //var imagesToDelete = Context.Images.Where(i => i.ProductId == request);

            //foreach (var image in imagesToDelete)
            //{
            //    //var imagePath = Path.Combine("wwwroot", "images", image.Path);

            //    //if (File.Exists(imagePath))
            //    //{
            //    //    File.Delete(imagePath);
            //    //}
            //    image.DeletedAt = DateTime.Now;
            //    image.DeletedBy = _currentUser.Email;
            //    image.IsActive = false;
            //}
            //Context.Images.RemoveRange(imagesToDelete);

            //product.DeletedAt = DateTime.UtcNow;
            //product.DeletedBy = _currentUser.Email;
            //product.IsActive = false;

            //Context.Products.Remove(product);
            //Context.SaveChanges();
        }
    }
}
