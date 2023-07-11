using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;


namespace CodingPackFrontRevised
{
    public partial class single_campaign : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["campaignid"]);

                Campaign campaign = sc.getCampaign(id);

                name.Value = campaign.Name;
                description.Value = campaign.Description;
                datefrom.Value = campaign.Date_from;
                dateto.Value = campaign.Date_to;
                location.Value = campaign.Location;
                campaigntype.SelectedItem.Value = campaign.Fundraiser;
            }
        
        }

        protected void add_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["campaignid"]);

            string tp = campaigntype.SelectedItem.Value;

            bool edit = sc.editCampaign(id, name.Value, description.Value, datefrom.Value, dateto.Value, tp, location.Value);

            if (edit == true)
            {

                foreach (User user in sc.getAllUsers())
                {
                    string to = user.Email;
                    string from = "codingpackfora@outlook.com";

                    MailMessage message = new MailMessage(from, to);

                    string mailbody = "Dear " + user.Name + ".. Please take note of the change in campaign details.The updated details are as follows. Date from: " + datefrom.Value + ", Date to: " + dateto.Value + ", at: " + location.Value + ".";
                    message.Subject = "Campaign Invite";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("smtp.office365.com", 587);
                    System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora@outlook.com", "Ifm3APr0g");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicCredential;

                    try
                    {
                        client.Send(message);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

                Response.Write("<script>alert('Campaign successfully created!Invites sent..');window.location = 'manage_campaigns.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Something wrong please try again..')</script>");
            }
        }

    }
}