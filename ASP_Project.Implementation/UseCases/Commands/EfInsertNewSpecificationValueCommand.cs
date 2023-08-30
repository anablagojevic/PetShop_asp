using ASP_Project.ApplicationLayer.UseCases.Commands;
using ASP_Project.ApplicationLayer.UseCases.DTO;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.UseCases.Commands
{
    public class EfInsertNewSpecificationValueCommand : EfUseCase, IInsertNewSpecificationValueCommand
    {
        public EfInsertNewSpecificationValueCommand(ProjectDbContext context) : base(context)
        {

        }

        public int Id => 18;

        public string Name => "Update specification using EF.";

        public string Description => "";

        public void Execute(NewSpecificationValueDto request)
        {
            // Proveri da li specifikacija sa unetim SpecificationId postoji
            var existingSpecification = Context.Specifications
                .FirstOrDefault(s => s.Id == request.SpecificationId);

            if (existingSpecification == null)
            {
                throw new Exception($"Specification with ID {request.SpecificationId} does not exist.");
            }

            // Proveri da li vrednost već postoji za datu specifikaciju
            var valueExists = Context.SpecificationValues
                .Any(sv => sv.SpecificationId == request.SpecificationId && sv.Value == request.Value);

            if (valueExists)
            {
                throw new Exception($"Value '{request.Value}' already exists for specification with ID {request.SpecificationId}.");
            }

            // Kreiraj novu vrednost specifikacije i dodaj je u bazu
            var newSpecificationValue = new SpecificationValue
            {
                Value = request.Value,
                SpecificationId = request.SpecificationId
            };

            Context.SpecificationValues.Add(newSpecificationValue);
            Context.SaveChanges();
        }
    }
}
