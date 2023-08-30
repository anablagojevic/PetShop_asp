using ASP_Project.ApplicationLayer.UseCases;
using ASP_Project.DataAccess;
using ASP_Project.Domain.Entities;
using System;

namespace ASP_Project.Implementation.Logging
{
    public class EfUserUseCaseLogs : IUseCaseLogger
    {
        private readonly ProjectDbContext _context;

        public EfUserUseCaseLogs(ProjectDbContext context)
        {
            _context = context;
        }

        public void Log(UseCaseLog log)
        {
            _context.UserUseCaseLogs.Add(new UserUseCaseLog
            {
                Username = log.User,
                UserId = log.UserId,
                UseCaseName = log.UseCaseName,
                Data = log.Data,
                CreatedAt = DateTime.UtcNow,
                IsAuthorized = log.IsAuthorized
            });

            _context.SaveChanges();
        }
    }
}
