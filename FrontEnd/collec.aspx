<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="collec.aspx.cs" Inherits="CodingPackFrontRevised.collec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .container1 {
            text-align: center;
            border: 7px solid black;
            width: 600px;
            height: 450px;
            padding-top: 0px;
            margin: 60px 350px 200px 330px;
            background-color: rgb(255,99,71);
        }

        btn {
            font-size: 25px;
            color: tomato;
            background-color: tomato;
        }

        header .header {
            background-color: #fff;
            /*background-color: tomato;*/
            height: 45px;
        }

        header a img {
            width: 134px;
            margin-top: 4px;
        }

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

            .login-page .form .login {
                margin-top: -31px;
                margin-bottom: 26px;
            }

        .form {
            position: relative;
            z-index: 1;
            /* background: #FFFFFF;*/
            /* background: tomato;*/
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

            .form input {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .form button {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                /*background-color: #328f8a;*/
                background-color: #ffff;
                background-image: linear-gradient(45deg,#328f8a,#08ac4b);
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
            }

            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }

                .form .message a {
                    color: #4CAF50;
                    text-decoration: none;
                }

        .container {
            position: relative;
            z-index: 1;
            max-width: 600px;
            margin: 0 auto;
        }

        body {
            /*background-color: #328f8a;*/
            /*background-color: tomato;*/
            background-color: #FFFFFF;
            background-image: linear-gradient(45deg,#ff6347,#ff367);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>

    <form id="form1" runat="server">

        <%--        <div class="login-page">
            <div class="form" style="background-color: tomato;">
                <div class="login">
                    <div class="login-header">
                        <h3 style="color: white">Collection Status</h3>
                        <br />
                    </div>
                </div>
                <form class="login-form" style="width:600px">--%>

        <div class="container1" style="padding-top: 1">
            <br />
            <div class="login-header">
                <h3 style="color: white">Collection Status</h3>
                <br />
            </div>
            <label height="50px" style="color: black; width: 100px">Donation </label>
            <input id="DonationType" type="text" runat="server" required="required" style="width: 300px;" readonly="readonly" />
            <br />
            <br />

            <label height="50px" style="color: black; width: 100px">Description </label>
            <input id="Description" type="text" runat="server" required="required" style="width: 300px;" readonly="readonly" />
            <br />
            <br />

            <label height="50px" style="color: black; width: 100px">Quantity </label>
            <input id="quantity" type="number" runat="server"  style="width: 300px;" min="1" max="100" />
            <br />
            <br />

            <asp:CheckBox runat="server" ID="type_match" Text=" Type Matches" Style="color: black;" />

            <asp:CheckBox runat="server" ID="description_matches" Text="Description Matches" Style="color: black;" /><br />
            <br />
            <label height="50px" style="color: black; width: 100px">Decision </label>
            <asp:DropDownList ID="decision" runat="server" Style="width: 300px">
                <asp:ListItem Selected="True" Value="COLLECTED"> COLLECTED  </asp:ListItem>
                <asp:ListItem Value="DECLINE"> DECLINE </asp:ListItem>
            </asp:DropDownList><br />
            <br />
            <%--                    <br />--%>

            <asp:Button ID="submit" Style="background-color: black; color: white; width:200px;" OnClick="submit_Click" runat="server" Text="Submit " />
            <asp:Button ID="cancel" Style="background-color: black; color: white; width: 200px;" OnClick="cancel_Click" runat="server" Text="Cancel " />

        </div>
    </form>

    <%--            </div>
        </div>


    </form>--%>
</asp:Content>
