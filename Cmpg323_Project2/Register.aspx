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
                       
        .auto-style5 {
            width: 328px;
            height: 37px;
            border-radius: 13px;
            text-align: center;
        }
       
          .auto-style6 {
              height: 92px;
              margin-top: 41px;
              margin-left: 0;
          }
       
          .auto-style7 {
              width: 116px;
          }
       
        </style>
<body>
   <form id="form1" runat="server">
    <header class="header1">
        <h1 class="logo">
            <a href="#" style="font-size: xx-large">WELCOME</a>
        </h1>
        <ul class="main-nav" id="myTopnav">
             <li><a href="/About.html">About</a></li>
            <li><a href="Home.aspx">Home</a></li>
            
            
            <li><a href="Login.aspx">Login</a></li>

        </ul>

    </header>

       <div>  
    <table align="center">  
            <tr>  
                <td colspan="2">  
                    <h3>  
                         Registration using Role</h3>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                 <asp:Label ID="Label1" runat="server" Text="UserName:" Font-Bold="True" Width="100px" BackColor="#FFFF66" ForeColor="#FF3300"></asp:Label>  
                    </td>  
                <td>  
                    <asp:TextBox ID="txt_UserName" runat="server" Width="150px"></asp:TextBox>  
                </td>  
                <td class="auto-style7"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter UserName" ControlToValidate="txt_UserName"></asp:RequiredFieldValidator> </td>  
            </tr>  
            <tr>  
                <td>  
                 <asp:Label ID="Label2" runat="server" Text="Password:" Font-Bold="True" Width="100px" BackColor="#FFFF66" ForeColor="#FF3300"></asp:Label>  
                 </td>  
                <td>  
                    <asp:TextBox ID="txt_Password"  TextMode="Password" runat="server"  
                        Width="150px"></asp:TextBox>  
                </td>  
                <td class="auto-style7"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Password" ControlToValidate="txt_Password"></asp:RequiredFieldValidator> </td>  
            </tr>  
            <tr>  
                <td>  
                <asp:Label ID="Label3" runat="server" Text="Role:" Font-Bold="True" Width="100px"  Height="100px" BackColor="#FFFF66" ForeColor="#FF3300"></asp:Label>  
                    </td>  
                <td>  
                    <asp:RadioButtonList ID="rbtRole" runat="server" RepeatDirection="Vertical">  
                        <asp:ListItem>Admin</asp:ListItem>  
                        <asp:ListItem>FreeUser</asp:ListItem>  
                         <asp:ListItem>PaidUser</asp:ListItem>  
                    </asp:RadioButtonList>  
                </td>  
                <td class="auto-style7"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select role" ControlToValidate="rbtRole"></asp:RequiredFieldValidator> </td>  
            </tr>  
            <tr>  
            <td></td>  
                <td>  
                    <asp:Button ID="btn_register" runat="server" BackColor="#CCFF99" Text="Register"  
                        onclick="btn_register_Click" />  
                </td>  
                <td class="auto-style7"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx"  
                        ForeColor="#663300">Click here to Login</asp:HyperLink></td>  
            </tr>  
            <tr>  
                <td align="center"  colspan="2">  
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>  
                </td>  
            </tr>  
        </table>  
    </div>
                <div style="padding: 100px" class="auto-style6">
                <h1 style="color: white; font-size: 40px">Already Have an account</h1><br />
                <p style="color: white;">Login now to upload or update your album</p><br />
                
                <button class="auto-style5" style="background-color: deepskyblue"><a href="/Login.aspx" style="color: white;">Login now</a>
                    </button>
                    </div>
         
                
            
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Register]"></asp:SqlDataSource>
    </form>
</body>
</html>
