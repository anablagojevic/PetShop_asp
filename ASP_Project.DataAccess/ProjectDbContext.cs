using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;

namespace ASP_Project.DataAccess
{
    public class ProjectDbContext : DbContext
    {
        public ProjectDbContext(DbContextOptions options = null) : base(options)
        {

        }

        public IApplicationUser User { get; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);

            modelBuilder.Entity<CategorySpecification>().HasKey(x => new { x.CategoryId, x.SpecificationId });
            modelBuilder.Entity<AnimalCategory>().HasKey(x => new { x.CategoryId, x.AnimalId });
            modelBuilder.Entity<UserUseCase>().HasKey(x => new { x.UserId, x.UseCaseId });

            base.OnModelCreating(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-087DRU1;Initial Catalog=pet_shop;Integrated Security=True").UseLazyLoadingProxies();
        }

        public override int SaveChanges()
        {
            foreach (var entry in this.ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            break;
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            e.UpdatedBy = User?.Identity;
                            break;
                        case EntityState.Deleted:
                            entry.State = EntityState.Modified;
                            e.DeletedAt = DateTime.UtcNow;
                            //e.DeletedBy = User?.Identity;
                            e.IsActive = false;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Specification> Specifications { get; set; }
        public DbSet<SpecificationValue> SpecificationValues { get; set; }
        public DbSet<CategorySpecification> CategorySpecifications { get; set; }
        public DbSet<Animal> Animals { get; set; }
        public DbSet<AnimalCategory> AnimalCategories { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Price> Prices { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<UserUseCaseLog> UserUseCaseLogs { get; set; }
    }
}
