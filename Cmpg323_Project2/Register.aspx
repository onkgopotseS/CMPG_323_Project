<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Cmpg323_Project2.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
      <style>
    * {
        box-sizing: border-box;
        margin: 0;
    }
    img {
        width: 100%;
        height: 500px;
        object-fit: cover;
       
    }
.one { height: 500px; background-image: url('https://as2.ftcdn.net/v2/jpg/04/11/19/61/1000_F_411196188_YqkLOl76sIUXDuRaLqsSOWlrihf8FZie.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; position: relative; 

}

div .one{
    padding-top: 12%;
    text-align: center;
    color: white;
}
    ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    h2,
    h3,
    a {
        color: black;
    }

    

    a {
        text-decoration: none;
    }

    .logo {
        margin: 0;
        font-size: 20px;
    }

    .main-nav {
        margin-top: 5px;
    }

        .logo a,
        .main-nav a {
            padding: 10px 15px;
            text-transform: uppercase;
            text-align: center;
            display: block;
        }

    .logo a {
        text-transform: uppercase;
        font-size: 25px;
        color: #574a2b;
    }

    .main-nav a {
        color: black;
        font-size: .99em;
        border: 1.2px solid #574a2b;
        border-top: 0;
        border-bottom: 0;
    }

        .main-nav a:hover {
            color: rgb(167, 54, 54);
        }

    .header1 {
        padding-top: .8em;
        padding-bottom: .8em;
        padding-left: 20px;
        padding-right: 20px;
        
    }

    .contain{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 4px;
        width: 100%;
    }
    .contain2 {
        padding-left: -60px;
        background-color: deepskyblue;
        height: 100vh;
    }
          @media (min-width: 769px) {
              .header1,
              .main-nav {
                  display: flex;
              }

              .header1 {
                  flex-direction: column;
                  align-items: center;
                  
              }
          }

    .header1{
        width: 80%;
        margin: 0 auto;
        max-width: 1150px;
    }

    
    

    @media (min-width: 1025px) {
        .header1 {
            flex-direction: row;
            justify-content: space-between;
            max-width: 100%;
        }
    }
        .auto-style1 {
            margin-top: 0;
        }
        .auto-style2 {
            margin-left: 0px;
        }
               
        .auto-style5 {
            width: 328px;
            height: 37px;
            border-radius: 13px;
            text-align: center;
        }
       
          .auto-style6 {
              height: 74px;
              margin-top: 41px;
          }
       
        </style>
<body>
   <form id="form1" runat="server">
    <header class="header1">
        <h1 class="logo">
            <a href="#">WELCOME</a>
        </h1>
        <ul class="main-nav" id="myTopnav">
             <li><a href="/About.html">About</a></li>
            <li><a href="Home.aspx">Home</a></li>
            
            
            <li><a href="Login.aspx">Login</a></li>

        </ul>

    </header>

        <div class="contain">
        <div class="contain1" style="margin-left: 15%; padding-top: 20px; padding-right: 10%; max-width: 100%">
            <h1 style="text-align: center; padding-bottom: 30px; padding-top: 30px;">Create your account now</h1>
            <br />
            <a href="/users/apply">
       <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                </a>
       <p>
           <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" Height="35px" Width="455px"></asp:TextBox>
       </p>
       <p>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Enter a a valid name" ForeColor="Red"></asp:RequiredFieldValidator>
       </p>
       <p>
           <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
       </p>
       <p>
           <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="455px"></asp:TextBox>
       </p>
       <p>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Enter a valid Last name" ForeColor="Red"></asp:RequiredFieldValidator>
       </p>
       <p>
           <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
       </p>
       <p>
           <asp:TextBox ID="TextBox3" runat="server" Height="35px" Width="455px" CssClass="auto-style3"></asp:TextBox>
       </p>
       <p>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Enter a valid email address" ForeColor="Red"></asp:RequiredFieldValidator>
       </p>
       <p>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       </p>
       <p>
           <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
       </p>
       <p>
         <asp:TextBox ID="TextBox4" runat="server" Height="35px" Width="455px" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
       </p>
       <p>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Enter valid Password" ForeColor="Red"></asp:RequiredFieldValidator>
       </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            <p>
               <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="#000099" ForeColor="White" OnClick="Button1_Click" Width="455px" Height="42px" />
       </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            <div class="contain2">
                <div style="padding: 100px" class="auto-style6">
                <h1 style="color: white; font-size: 40px">Already Have an account</h1><br />
                <p style="color: white;">Login now to upload or update your album</p><br />
                
                <button class="auto-style5" style="background-color: deepskyblue"><a href="/Login.aspx" style="color: white;">Login now</a>
                    </button>
                    </div>
            </div>
                </div>
            </div>
    </form>
</body>
</html>
