using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ASP_Project.DataAccess.Configurations
{
    public class UserConfiguration : EntityConfiguration<User>
    {
        protected override void ConfigureRules(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.FirstName).HasMaxLength(30).IsRequired();
            builder.Property(x => x.LastName).HasMaxLength(30).IsRequired();

            builder.HasIndex(x => x.Email).IsUnique();
            builder.Property(x => x.Email).HasMaxLength(50).IsRequired();

            builder.HasIndex(x => x.Username).IsUnique();
            builder.Property(x => x.Username).HasMaxLength(30).IsRequired();

            builder.Property(x => x.Password).HasMaxLength(255).IsRequired();

            builder.HasMany(x => x.Comments).WithOne(x => x.User);
            builder.HasMany(x => x.Carts).WithOne(x => x.User);

            builder.HasMany(x => x.UseCases).WithOne(x => x.User).HasForeignKey(x => x.UserId);
        }
    }
}
