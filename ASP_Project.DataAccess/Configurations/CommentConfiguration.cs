using ASP_Project.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.DataAccess.Configurations
{
    public class CommentConfiguration : EntityConfiguration<Comment>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x => x.CommentText).HasMaxLength(300).IsRequired();
        }
    }
}
