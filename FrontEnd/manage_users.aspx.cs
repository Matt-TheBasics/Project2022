using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class manage_users : System.Web.UI.Page
    {

        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";

            foreach (User user in sc.getAllUsers())
            {
                sOutput += "<tr>";
                sOutput += "<td>" + "<a href='m_donordonations.aspx?userid=" + user.UserID + "'>" + user.Name + "</td>";
                sOutput += "<td>" + user.Surname + "</td>";
                sOutput += "<td>" + user.Email + "</td>";

                if (user.Usertype == "DONOR")
                {
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Usertype + "</a>" + "</td>";
                }
                else if (user.Usertype == "DRIVER")
                {
                    sOutput += "<td style='color:white;background-color:rgb(255, 255, 144);'>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Usertype + "</a>" + "</td>";
                }
                else if (user.Usertype == "MANAGER")
                {
                    sOutput += "<td style='color:white;background-color:rgba(255, 99, 71, 0.5);'>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Usertype + "</a>" + "</td>";
                }

                sOutput += "<td>" + user.Contact + "</td>";
                sOutput += "<td>" + user.Adress + "</td>";
                sOutput += "</tr>";
            }


            datatable.InnerHtml = sOutput;
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

        
        protected void adduser_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Register_User.aspx");
        }

    }
}