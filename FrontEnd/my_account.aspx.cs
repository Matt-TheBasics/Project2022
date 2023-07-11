using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;
using System.Text.RegularExpressions;


namespace CodingPackFrontRevised
{
    public partial class my_account : System.Web.UI.Page
    {
        ServiceClient client = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

            if(!Page.IsPostBack)
            {
                int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

                User user = client.getUser(UserID);

                if(user.Usertype == "MANAGER")
                {
                    manager1.Visible = true;
                    manager2.Visible = true;
                    manager3.Visible = true;
                    dona1.Visible = true;
                    //manager4.Visible = true;
                }
                
                if(user.Usertype == "DRIVER")
                {
                    driver.Visible = true; 
                }
                
                if(user.Usertype == "DONOR")
                {
                    donor1.Visible = true;
                    dona1.Visible = true;
                    //invite1.Visible = true; 
                }



                name.Value = user.Name;
                surname.Value = user.Surname;
                email.Value = user.Email;
                password.Value = user.Password;
                confirmpassword.Value = user.Password;
                contact.Value = user.Contact;
                address.Value = user.Adress;

            }
            //int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

            //User user = client.getUser(UserID);

            //name.Value = user.Name;
            //surname.Value = user.Surname;
            //email.Value = user.Email;
            //password.Value = user.Password;
            //confirmpassword.Value = user.Password;
            //contact.Value = user.Contact;
            //address.Value = user.Adress;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

            User user = client.getUser(UserID);

            if(user.Usertype == "DONOR")
            {
                Response.Redirect("donor.aspx");
            }

            if (user.Usertype == "DRIVER")
            {
                Response.Redirect("driverr.aspx");
            } 
            
            if (user.Usertype == "MANAGER")
            {
                Response.Redirect("manager.aspx");
            }

        }


        protected void Register_Click(object sender, EventArgs e)
        {
            int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

            User user = client.getUser(UserID);

            if (user.Usertype == "DONOR")
            {
                bool edituser = client.editUser(user.UserID, name.Value, surname.Value, email.Value, address.Value, password.Value,"DONOR", contact.Value);
                if (edituser)
                {
                    Response.Write("<script>alert('Account details update successfull!..');window.location = 'donor.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Account details update unsuccessfull!Please try again..')</script>");
                }
            }

            if (user.Usertype == "DRIVER")
            {
                bool edituser = client.editUser(user.UserID, name.Value, surname.Value, email.Value, address.Value, password.Value, "DRIVER", contact.Value);

                if (edituser)
                {
                    Response.Write("<script>alert('Account details update successfull!..');window.location = 'driverr.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Account details update unsuccessfull!Please try again..')</script>");
                }
            }

            if (user.Usertype == "MANAGER")
            {
                bool edituser = client.editUser(user.UserID, name.Value, surname.Value, email.Value, address.Value, password.Value, "MANAGER", contact.Value);
               
                if(edituser)
                {
                    Response.Write("<script>alert('Account details update successfull!..');window.location = 'manager.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Account details update unsuccessfull!Please try again..')</script>");
                }
            }

        }

    }
}