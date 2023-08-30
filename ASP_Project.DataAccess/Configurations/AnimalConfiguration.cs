using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.DataAccess.Configurations
{
    public class AnimalConfiguration : EntityConfiguration<Animal>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Animal> builder)
        {
            builder.HasIndex(x => x.Name);

            builder.Property(x => x.Name).HasMaxLength(40).IsRequired();
        }
    }
}
