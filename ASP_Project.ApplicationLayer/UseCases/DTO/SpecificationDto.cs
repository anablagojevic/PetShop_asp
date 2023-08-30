using System.Collections.Generic;

namespace ASP_Project.ApplicationLayer.UseCases.DTO
{
    public class SpecificationDto : BaseDto
    {
        public string Name { get; set; }
        public IEnumerable<SpecificationValueDto> SpecificationValues { get; set; }
    }

    public class SpecificationValueDto : BaseDto
    {
        public string Value { get; set; }
    }

    public class CreateSpecificationDto : BaseDto
    {
        public string Name { get; set; }
        public IEnumerable<string> Values { get; set; }
        public IEnumerable<int> CategoryIds { get; set; }
    }

    public class NewSpecificationValueDto
    {
        public string Value { get; set; }
        public int SpecificationId { get; set; }
    }
}
