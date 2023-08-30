using ASP_Project.ApplicationLayer.Exceptions;
using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfUpdateProductCommand : EfUseCase, IUpdateProductCommand
    {
        private readonly IApplicationUser _currentUser;
        private readonly UpdateProductValidator _validator;
        public EfUpdateProductCommand(ProjectDbContext context, IApplicationUser currentUser, UpdateProductValidator validator) : base(context)
        {
            _currentUser = currentUser;
            _validator = validator;
        }

        public int Id => 20;

        public string Name => "Update product using EF";

        public string Description => "";

        public void Execute(UpdateProductDto request)
        {
            _validator.ValidateAndThrow(request);

            var product = Context.Products.FirstOrDefault(p => p.Id == request.Id);

            if (product == null)
            {
                throw new EntityNotFoundException(nameof(Product), request.Id);
            }

            product.Title = request.NewTitle;
            product.Description = request.NewDescription;
            product.UpdatedBy = _currentUser.Email;

            var priceToUpdate = Context.Prices.FirstOrDefault(p => p.ProductId == product.Id);

            if (priceToUpdate != null)
            {
                priceToUpdate.EndedAt = DateTime.UtcNow;
                priceToUpdate.IsActive = false;
            }

            var newPrice = new Price
            {
                Value = request.NewPriceValue,
                StartedAt = DateTime.UtcNow,
                ProductId = product.Id,
                UpdatedBy = _currentUser.Email,
            };

            Context.Prices.Add(newPrice);
            Context.SaveChanges();

            if (!string.IsNullOrEmpty(request.NewImageFileName))
            {
                var image = new Image
                {
                    Path = request.NewImageFileName,
                    UpdatedBy = _currentUser.Email,
                };

                product.Images.Add(image);
            }

            Context.SaveChanges();
        }
    }
}
