<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Cmpg323_Project2.Home" %>

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
          .auto-style8 {
              width: 107%;
              height: 206px;
          }
          .auto-style9 {
              width: 209px;
          }
          .auto-style10 {
              height: 23px;
              width: 209px;
          }
          .auto-style11 {
              width: 106%;
              height: 206px;
              margin-bottom: 0;
          }
          .auto-style12 {
              width: 295px;
          }
          .auto-style13 {
              height: 23px;
              width: 295px;
          }
          .auto-style14 {
              width: 100%;
              margin-right: 0;
          }
          .auto-style15 {
              width: 275px;
          }
          .auto-style16 {
              height: 23px;
              width: 275px;
          }
       
          .auto-style17 {
              width: 109%;
              height: 222px;
          }
       
        </style>
<body>
    
   

   <form id="form2" runat="server">
    <header class="header1">
        <h1 class="logo">
            <a href="#" style="font-size: xx-large; color: #0099CC;">[ PHOTOALBUM ]</a>
        </h1>
        <ul class="main-nav" id="myTopnav">
             <li><a href="/About.html">About</a></li>
            <li><a href="Register.aspx">Register</a></li>                       
            <li><a href="Login.aspx">Login</a></li>

        </ul>

    </header>
       <div>
            <h1 style="text-align: center; padding-bottom: 30px; padding-top: 30px;">The power of photos in your hands</h1>
            <p style="text-align: center; padding-bottom: 30px; padding-top: 30px;">
                <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Bold="True" Font-Size="X-Large" ForeColor="#0099CC" Text="Simple tool to upload, manage and share high quality images"></asp:Label>
            </p>
            <p style="text-align: center; padding-bottom: 30px; padding-top: 30px;">
                <table class="auto-style14" style="background-position: center center; text-align: center;">
                    <tr>
                        <td class="auto-style9">Upload your photos</td>
                        <td class="auto-style12">
                            <img alt="" class="auto-style11" src="" style="background-position: center center; background-image: url('Images/images (3).png');" /><br />
                            <br />
                        </td>
                        <td class="auto-style15">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">View your photos</td>
                        <td class="auto-style12">
                            <img alt="" class="auto-style8" src="" style="background-position: center center; background-image: url('Images/images (7).jpeg')" /><br />
                            <br />
                        </td>
                        <td class="auto-style15">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Share your photos</td>
                        <td class="auto-style13">
                            <img alt="" class="auto-style17" src="" style="background-image: url('Images/images (2).png'); background-repeat: no-repeat; background-position: center center" /><br />
                            <br />
                        </td>
                        <td class="auto-style16"></td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                    </tr>
                </table>
            </p>
        </div>
    </form>
        
</body>
</html>
