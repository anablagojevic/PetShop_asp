using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.DataAccess.Configurations
{
    public class ProductConfiguration : EntityConfiguration<Product>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Title).IsRequired().HasMaxLength(70);
            builder.Property(x => x.Description).IsRequired().HasMaxLength(200);
            builder.HasMany(x => x.Images).WithOne(x => x.Product);
            builder.HasMany(x => x.Prices).WithOne(x => x.Product);
            builder.HasMany(x => x.Comments).WithOne(x => x.Product);
        }
    }
}
