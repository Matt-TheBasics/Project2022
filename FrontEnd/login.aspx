<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CodingPackFrontRevised.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .container1 {
            text-align: center;
            border: 7px solid black;
            width: 600px;
            height: 525px;
            padding-top: 0px;
            margin: 10px 350px 200px 330px;
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
            max-width: 300px;
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

        <%-- <asp:FileUpload ID="FileUpload1" runat="server" /> <br />
         <asp:Button ID="Button1" runat="server" Text="upload file" OnClick="UploadFile" /><br />
    <asp:Image ID="Image1" runat="server" />--%>

        <div class="login-page">
            <div class="form" style="background-color: tomato;">
                <div class="login">
                    <div class="login-header">
                        <h3 style="color: black">LOGIN</h3>
                        <p style="color: black">Please enter your credentials to login.</p>
                    </div>
                </div>
                <form class="login-form">                    
                    
                    <input id="email" type="Email" placeholder="email" runat="server" required="required" title="examplel@example.com" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                    <input id="password" type="password" placeholder="password" runat="server" required="required" />
                    <asp:Button ID="loginbutton" Style="background-color: black; color: white;" OnClick="Login_Click" runat="server" Text="Login In" /> 
                    <p class="message" style="color: black">Not registered? <a href="registe.aspx" style="color: black"><u>Create an account</u></a></p>
                    <p class="message" style="color: black">Forgot <a href="contact2.aspx" style="color: black"><u>Password?</u></a></p>

                </form>
            </div>
        </div>



        <%--<div class="container1">

            <br />
            <h2>Log In  </h2>

            <label id="lblusername" typeof="text" style="width: 200px; color: white;">Email</label>
            <input id="email" type="Email" runat="server" placeholder="Type your email" required="required" style="width: 405px;" title="email@****.***" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            <br />
            <br />

            <label id="lblpassword" typeof="text" style="width: 200px; color: white;">Password</label>
            <input id="password" type="Password" runat="server" placeholder="Tyoe your password" style="width: 405px;" required="required" />
            <br />
            <br />
            <asp:Button ID="loginbutton" runat="server" Text="Login In" class="btn" OnClick="Login_Click" Height="40px" Style="width: 405px; background-color: black; color: white;" />

            <br />
            <br />
            <input type="checkbox" checked="checked" name="remember"> Remember me
            <br />
            <br />
            <label id="add" typeof="text" style="width: 200px; color: white;">Need an account? </label>
            <asp:Button ID="register" runat="server" Text="Register HERE" class="btn" OnClick="Register_Click" Height="40px" Style="width: 200px; background-color: black; color: white;" />



        </div>--%>





        <%--<div class="wrapper login-2">
            <div class="container">
                <div class="fa-align-center">
                    <div style="display: inline-block">
                        <div class="login-form">

                            
                            
                            <div id="emploeelogin" runat="server" visible="true">

                                <br />
                                <br />
                                <h2>Login</h2>
                                <br />
                                <input id="email" type="Email" runat="server" placeholder="Email" />
                                <br />
                                <br />
                                <input id="password" type="Password" runat="server" placeholder="Password" />
                                <br />
                                <br />
                                <asp:Button ID="log" runat="server" Text="Login" class="btn btn-lg btn-primary px-3 d-none d-lg-block" OnClick="Button1_Click" Height="40px" Width="200px" />
                            </div>

                        </div>
                    </div>

                </div>

            </div>

        </div>--%>
    </form>
</asp:Content>

