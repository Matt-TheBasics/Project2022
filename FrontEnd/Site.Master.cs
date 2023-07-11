using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;


namespace CodingPackFrontRevised
{
    public partial class SiteMaster : MasterPage
    {

        ServiceClient client = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LoggedInUserID"] != null)
            {
                home.Visible = false;
                about.Visible = false;
                account1.Visible = true;
                contact.Visible = false;

                int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

                var loggedInUser = client.getUser(UserID);

                if (loggedInUser.Usertype.Equals("MANAGER"))
                {
                    managerlogin.Visible = true;
                    loggedin.Visible = true;
                    loggedoff.Visible = false;
                    loggedoff1.Visible = false;
                    donate.Visible = false;

                    donation_m.Visible = true;
                    users_m.Visible = true;
                    
                }
                else if (loggedInUser.Usertype.Equals("ADMIN"))
                {
                    
                    loggedin.Visible = true;
                    loggedoff.Visible = false;
                    loggedoff1.Visible = false;
                    donate.Visible = false;

                }
                else if (loggedInUser.Usertype.Equals("DONOR"))
                {
                    //donorlogin.Visible = true;
                    loggedin.Visible = true;
                    loggedoff.Visible = false;
                    loggedoff1.Visible = false;
                    donate.Visible = false;
                    dona.Visible = true;
                    dona1.Visible = true;

                }
                else if (loggedInUser.Usertype.Equals("DRIVER"))
                {
                    //driverlogin.Visible = true;
                    loggedin.Visible = true;
                    loggedoff.Visible = false;
                    loggedoff1.Visible = false;
                    donate.Visible = false;
                    driv.Visible = true;
                }
            }

        }

    }
}