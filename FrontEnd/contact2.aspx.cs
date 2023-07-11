using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;

namespace CodingPackFrontRevised
{
    public partial class contact2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void contac_Click(object sender, EventArgs e)
        {
            string to = "codingpackfora1@outlook.com";
            string from = "codingpackfora1@outlook.com";

            MailMessage message1 = new MailMessage(from, to);

            string mailbody = "Sender Name: " + name.Value + " , Email: " + email.Value + " Message: " + message.Value;
            message1.Subject = "Enquiry";
            message1.Body = mailbody;
            message1.BodyEncoding = Encoding.UTF8;
            message1.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora@outlook.com", "Ifm3APr0g");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential;

            try
            {
                client.Send(message1);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Write("<script>alert('Query recieved.Will revert back to you shortly !..');window.location = 'index.aspx';</script>");

        }

    }
}