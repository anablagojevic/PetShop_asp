﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.Emails
{
    public class EmailDto
    {
        public string To { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
    }
}
