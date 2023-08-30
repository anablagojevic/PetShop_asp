using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ASP_Project.DataAccess.Migrations
{
    public partial class AddTableUserUseCaseLog : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "UserUseCaseLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UseCaseName = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Data = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsAuthorized = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true),
                    DeletedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserUseCaseLogs", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserUseCaseLogs_CreatedAt",
                table: "UserUseCaseLogs",
                column: "CreatedAt");

            migrationBuilder.CreateIndex(
                name: "IX_UserUseCaseLogs_UseCaseName",
                table: "UserUseCaseLogs",
                column: "UseCaseName");

            migrationBuilder.CreateIndex(
                name: "IX_UserUseCaseLogs_Username",
                table: "UserUseCaseLogs",
                column: "Username");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserUseCaseLogs");
        }
    }
}
