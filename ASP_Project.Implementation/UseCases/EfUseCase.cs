using ASP_Project.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.Implementation.UseCases
{
    public abstract class EfUseCase
    {
        protected EfUseCase(ProjectDbContext context)
        {
            Context = context;
        }

        protected ProjectDbContext Context { get; }
    }
}
