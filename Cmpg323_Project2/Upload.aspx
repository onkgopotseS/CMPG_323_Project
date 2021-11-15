<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Cmpg323_Project2.Upload" %>

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
        font-size: 15px;
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
              width: 48%;
          }
          .auto-style2 {
              width: 186px;
          }
                       
        </style>
<body>
   <form id="form1" runat="server">
    <header class="header1">
        <h1 class="logo">
            <a href="#" style="font-size: xx-large">WELCOME&nbsp;
            <asp:Label ID="Label2" runat="server" Text="."></asp:Label>
            </a>
        &nbsp;</h1>
        <ul class="main-nav" id="myTopnav">
             <li><a href="/Login">Log Out</a></li>
            <li><a href="/Shared_Photos.aspx">View&nbsp; Pictures</a></li>
            <li><a href="/Register.aspx">Register</a></li>
            
            

        </ul>
         </header>
  
        <div class="contain">
        <div class="contain1" style="margin-left: 15%; padding-top: 20px; padding-right: 10%; max-width: 100%">
            <h1 style="text-align: center; padding-bottom: 30px; padding-top: 30px;">Upload your Pictures</h1>

   

    <asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"  />
            <%--<br />--%>
            <br />
<hr />
  
            <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
            <br />
            <br />
            <p>  
        <div>           
            <asp:Image ID="Image1" runat="server" Height="356px" Width="385px" />
            
               <asp:Button ID="Button6" runat="server" OnClick="Button5_Click" Text="Download photo" />
          
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Share Photo" Width="140px" />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Delete Photo" Width="140px" />
                        <br />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Save" />
                        <br />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button3" runat="server" Text="View Meta data" OnClick="Button3_Click" />
                    </td>
                    
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div> 
    </p> 
        <br />
     <div class="contain2">
                <div style="padding: 100px" class="auto-style6">
                <h1 style="color: white; font-size: 40px">want to view Photos?</h1><br />
                <p style="color: white;">Click here to view Uploaded pictures</p><br />
                
                <button class="auto-style5" style="background-color: deepskyblue"><a href="/Shared_Photos.aspx" style="color: white;">View Pictures</a>
                    </button>
                    </div>
            </div>

        <div>
        </div>
            </div>
            </div>
        
    </form>
</body>
</html>
