using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.DataAccess.Configurations
{
    public class SpecificationValueConfiguration : EntityConfiguration<SpecificationValue>
    {
        protected override void ConfigureRules(EntityTypeBuilder<SpecificationValue> builder)
        {
            builder.Property(x => x.Value).IsRequired();
        }
    }
}
