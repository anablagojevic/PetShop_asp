using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.DataAccess.Configurations
{
    public class SpecificationConfiguration : EntityConfiguration<Specification>
    {
        protected override void ConfigureRules(Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<Specification> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(50);
            builder.HasIndex(x => x.Name).IsUnique();
            builder.HasMany(x => x.SpecificationValues).WithOne(x => x.Specification).HasForeignKey(x => x.SpecificationId).OnDelete(DeleteBehavior.Restrict);

        }
    }
}
