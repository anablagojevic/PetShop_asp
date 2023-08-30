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
    public class EfCreateProductCommand : EfUseCase, ICreateProductCommand
    {
        private readonly CreateProductValidator _validator;
        public EfCreateProductCommand(ProjectDbContext context, CreateProductValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 19;

        public string Name => "Create product using EF";

        public string Description => "";

        public void Execute(CreateProductDto request)
        {
            _validator.ValidateAndThrow(request);

            if (!Context.Categories.Any(c => c.Id == request.CategoryId))
            {
                throw new EntityNotFoundException(nameof(Category), request.CategoryId);
            }

            var product = new Product
            {
                Title = request.Title,
                CategoryId = request.CategoryId,
                Description = request.Description
            };

            Context.Products.Add(product);
            Context.SaveChanges();

            var price = new Price
            {
                Value = request.PriceValue,
                StartedAt = DateTime.UtcNow,
                ProductId = product.Id
            };

            if (!string.IsNullOrEmpty(request.ImageFileName))
            {
                var image = new Image
                {
                    Path = request.ImageFileName,
                };

                product.Images.Add(image);
            }

            Context.Prices.Add(price);
            Context.SaveChanges();
        }
    }
}
