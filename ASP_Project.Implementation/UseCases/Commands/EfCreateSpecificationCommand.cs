using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using ASP_Project.Implementation.Validators;
using FluentValidation;
using System.Linq;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfCreateSpecificationCommand : EfUseCase, ICreateSpecificationCommand
    {
        private readonly CreateSpecificationValidator _validator;

        public EfCreateSpecificationCommand(ProjectDbContext context, CreateSpecificationValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 6;

        public string Name => "Create specification using EF";

        public string Description => "";

        public void Execute(CreateSpecificationDto request)
        {
            _validator.ValidateAndThrow(request);

            var spec = new Specification
            {
                Name = request.Name
            };

            Context.Specifications.Add(spec);
            Context.SaveChanges();

            var values = request.Values.Select(x => new SpecificationValue
            {
                Value = x,
                SpecificationId = spec.Id
            }).ToList();

            Context.SpecificationValues.AddRange(values);
            Context.SaveChanges();

            var specCategory = request.CategoryIds.Select(x => new CategorySpecification
            {
                SpecificationId = x,
                CategoryId = spec.Id
            });

            Context.CategorySpecifications.AddRange(specCategory);
            Context.SaveChanges();
        }
    }
}
