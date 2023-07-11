using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class distance : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

                User user = sc.getUser(UserID);

                if (user.Usertype == "MANAGER")
                {
                    m1.Visible = true;
                    m2.Visible = true;
                    m3.Visible = true;
                }

                if (user.Usertype == "DONOR")
                {
                    dona.Visible = true;
                }
            }
        }

        protected void adddonation_Click(object sender, EventArgs e)
        {
            //double distan;

            //Double.TryParse(res.Value, out distan);

            //if (distan > 100)
            //{
            //    Response.Write("<script>alert('Please note if more than 100km your application will be declined as we do pickups for donors within 100km radius.');window.location = 'donor.aspx';</script>");
            //}
            //if (distan < 100)
            //{
            //    Response.Write("<script>alert('You are within 100km radius.Pick up will be done');window.location = 'donor.aspx';</script>");
            //}
        }
    }
}