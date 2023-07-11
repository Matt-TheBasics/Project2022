using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontReviseds
{
    public partial class usermanagement : System.Web.UI.Page
    {

        ServiceClient sc = new ServiceClient();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adduser_Click(object sender, EventArgs e)
        {
            //regdetails.Visible = true;
            //uList.Visible = false;

        }


        protected void edituser_Click(object sender, EventArgs e)
        {

        }

        protected void viewuser_Click(object sender, EventArgs e)
        {

            //regdetails.Visible = false;

            var sOutput = "";

            sOutput += "<table>";
            sOutput += "<thead> <th>" + "Donor ID" + "</th>";
            sOutput += " <th scope='col'>" + "Name" + "</th>";
            sOutput += " <th scope='col'>" + "Surname" + "</th>";
            sOutput += " <th scope='col'>" + "Email" + "</th>";
            sOutput += " <th scope='col'>" + "Address" + "</th>";
            sOutput += " <th scope='col'>" + "Contact" + "</th>";
            sOutput += " <th scope='col'>" + "Usertype" + "</th>";


            sOutput += "</thead> ";

            sOutput += "<tbody>";

            foreach (User don in sc.getAllDonors())
            {
                sOutput += "<tr><td>" + don.UserID + "</td>";
                sOutput += "<td>" + don.Name + "</td>";
                sOutput += "<td>" + don.Surname + "</td>";
                sOutput += "<td>" + don.Email + "</td>";
                sOutput += "<td>" + don.Adress + "</td>";
                sOutput += "<td>" + don.Contact + "</td>";
                sOutput += "<td>" + don.Usertype + "</td>";
            }

            sOutput += "</tbody></table>";

            sOutput += "";
            sOutput += "";
            sOutput += "";
            sOutput += "";
            sOutput += "";
            sOutput += "";
            sOutput += "";


            sOutput += "<table>";
            sOutput += "<thead> <th>" + "Employee ID" + "</th>";
            sOutput += " <th scope='col'>" + "Name" + "</th>";
            sOutput += " <th scope='col'>" + "Surname" + "</th>";
            sOutput += " <th scope='col'>" + "Email" + "</th>";
            sOutput += " <th scope='col'>" + "Address" + "</th>";
            sOutput += " <th scope='col'>" + "Contact" + "</th>";
            sOutput += " <th scope='col'>" + "Usertype" + "</th>";

            sOutput += "</thead> ";

            sOutput += "<tbody>";


            foreach (User emp in sc.getAllAdmin())
            {
                sOutput += "<tr><td>" + emp.UserID + "</td>";
                sOutput += "<td>" + emp.Name + "</td>";
                sOutput += "<td>" + emp.Surname + "</td>";
                sOutput += "<td>" + emp.Email + "</td>";
                sOutput += "<td>" + emp.Adress + "</td>";
                sOutput += "<td>" + emp.Contact + "</td>";
                sOutput += "<td>" + emp.Usertype + "</td>";
            }

            sOutput += "</tbody></table>";

            //uList.InnerHtml = sOutput;
            sc.Close();
        }


        protected void Register_Click(object sender, EventArgs e)
        {
            //bool register = sc.Register(name.Value, surname.Value, email.Value, address.Value, password.Value, usertype.Value, contact.Value);


            //if (register == true)
            //{
            //{
            //{
            //    Response.Write("Employee Registration Successfull");
            //}
            //else
            //{
            //    Response.Write("Failed to register the user");
            //}
        }


    }
}