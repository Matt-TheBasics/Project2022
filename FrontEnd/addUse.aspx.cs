using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class addUse : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();


        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";

            foreach (Donation don in sc.getAllDonations())
            {
                var user = sc.getUser(don.DonorID);

                sOutput += "<tr>";
                sOutput += "<td>" + "<a href='m_donordonations.aspx?userid=" + user.UserID + "'>" + user.Name + "</td>";
                sOutput += "<td>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Email + "</td>";
                sOutput += "<td>" + don.DonationType + "</td>";
                sOutput += "<td>" + don.Description + "</td>";
                sOutput += "<td>" + don.Quantity + "</td>";
                sOutput += "<td>" + don.PickupAddress + "</td>";
                sOutput += "<td>" + don.PickupDate + "</td>";
                if (don.Status == "PENDING")
                {
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                else if (don.Status == "APPROVE")
                {
                    sOutput += "<td style='color:white;background-color:rgb(255, 255, 144);'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                else if (don.Status == "COLLECTED")
                {
                    sOutput += "<td style='color:white;background-color:rgba(255, 99, 71, 0.5);'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                sOutput += "</tr>";
            }

            datatable.InnerHtml = sOutput;

            if (!Page.IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["userid"]);

                User user = sc.getUser(id);
                if (user != null)
                {
                    name.Value = user.Name;
                    surname.Value = user.Surname;
                    email.Value = user.Email;
                    address.Value = user.Adress;
                    contact.Value = user.Contact;
                    user_type.SelectedItem.Value = user.Usertype;
                    password.Value = user.Password;
                    confirmpassword.Value = password.Value;
                }
            }
        }

        protected void adduser_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Register_User.aspx");
        }

        protected void adddonation_Click(object sender, EventArgs e)
        {
            //Response.Redirect("add_donation.aspx");
        }


        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("manage_donations.aspx");
        }

        protected void Register_Click(object sender, EventArgs e)
        {

            bool registered = sc.Registered(email.Value, password.Value);
            User user = sc.getUserB(email.Value);

            if (user != null)
            {

                string tp = user_type.SelectedItem.Value;

                bool edituser = sc.editUser(user.UserID, name.Value, surname.Value, email.Value, address.Value, password.Value, tp, contact.Value);

                Response.Write("<script>alert('User update successfull!..');window.location = 'manage_users.aspx';</script>");

            }
            else
            {
                string tp = user_type.SelectedItem.Value;

                int register = sc.Register(name.Value, surname.Value, email.Value, address.Value, password.Value, tp, contact.Value);

                if (register == 1)

                {
                    Response.Write("<script>alert('User Regitration Successfull!..');window.location = 'manage_users.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('User registration unsuccessfully please try again')</script>");
                }
            }
        }
    }
}