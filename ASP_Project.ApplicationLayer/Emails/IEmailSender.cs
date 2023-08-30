using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASP_Project.ApplicationLayer.Emails
{
    public interface IEmailSender
    {
        void Send(EmailDto mail);
    }
}
