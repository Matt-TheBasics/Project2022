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
    public partial class registe : System.Web.UI.Page
    {
        ServiceClient client = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool isValidEmail(string email)
        {
            Regex emailregex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", RegexOptions.IgnoreCase);
            return emailregex.IsMatch(email);
        }

        protected bool isValidContact(string contact)
        {
            Regex contactregex = new Regex(@"^[0]\d{9}$", RegexOptions.IgnoreCase);
            return contactregex.IsMatch(contact);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if(Page.IsPostBack)
            {
                if (accept.Checked)
                {
                    bool validemail = isValidEmail(email.Value);
                    bool validcontact = isValidContact(contact.Value);

                    bool alreadyexist = client.Registered(email.Value, password.Value);

                    if (alreadyexist == true)
                    {
                        Response.Write("<script>alert('User Already exist!..');window.location = 'login.aspx';</script>");
                    }
                    else
                    {
                        if (password.Value != confirmpassword.Value)
                        {
                            Response.Write("<script>alert('Passwords do not match!')</script>");
                        }
                        else
                        {
                            int register = client.Register(name.Value, surname.Value, email.Value, address.Value, password.Value, "DONOR", contact.Value);

                            if (register == 1)
                            {
                                Response.Write("<script>alert('User registration successful.User can now login!..');window.location = 'login.aspx';</script>");
                            }
                            else if (register == -1)
                            {
                                Response.Write("<script>alert('Failed to register user!..');window.location = 'registe.aspx';</script>");
                            }
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please accept the terms an conditions to register!..');window.location = 'registe.aspx';</script>");
                }
            }
            

        }
    }
}