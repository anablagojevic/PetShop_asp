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
    public class CategoryConfiguration : EntityConfiguration<Category>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Category> builder)
        {
            builder.HasIndex(x => x.Name);

            builder.Property(x => x.Name).HasMaxLength(40).IsRequired();

            builder.HasMany(x => x.ChildCategories)
                    .WithOne(x => x.ParentCategory)
                    .HasForeignKey(x => x.ParentId)
                    .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Products)
                    .WithOne(x => x.Category)
                    .HasForeignKey(x => x.CategoryId)
                    .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Specifications)
                    .WithOne(x => x.Category)
                    .HasForeignKey(x => x.CategoryId)
                    .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(x => x.AnimalCategories)
                    .WithOne(x => x.Category)
                    .HasForeignKey(x => x.CategoryId)
                    .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
