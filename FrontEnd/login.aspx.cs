using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;
using System.IO;


namespace CodingPackFrontRevised
{
    public partial class login : System.Web.UI.Page
    {

        ServiceClient client = new ServiceClient();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            int UserID = client.Login(email.Value, password.Value);

            if (UserID == -1)
            {
                Response.Write("<script>alert('Login In Failed! Please try again..');window.location = 'login.aspx';</script>");

            }
            else
            {

                Session["LoggedInUserID"] = UserID;

                var loggedInUser = client.getUser(UserID);

                if (loggedInUser.Usertype.Equals("DONOR"))
                {

                    Response.Redirect("donor.aspx");
                }
                else if (loggedInUser.Usertype.Equals("ADMIN"))
                {
                    Response.Redirect("admin.aspx");
                }
                else if (loggedInUser.Usertype.Equals("MANAGER"))
                {
                    bool collected = client.collecteddonations();

                    if(collected)
                    {
                        Response.Write("<script>alert('Donations Colleced today');window.location = 'manager.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('NO Donations Colleced today');window.location = 'manager.aspx';</script>");
                    }
                }
                else if (loggedInUser.Usertype.Equals("DRIVER"))
                {
                    Response.Redirect("driverr.aspx");
                }
            }
        }  
        
    }
}