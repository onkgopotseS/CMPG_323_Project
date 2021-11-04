<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shared_Photos.aspx.cs" Inherits="Cmpg323_Project2.Shared_Photos" %>

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
                       
        </style>
<body>
   <form id="form1" runat="server">
    <header class="header1">
        <h1 class="logo">
            <a href="#" style="font-size: xx-large">WELCOME</a>
        </h1>
        <ul class="main-nav" id="myTopnav">
             <li><a href="/About.html">Log Out</a></li>
            <li><a href="/Home.aspx">View shared Pictures</a></li>
            <li><a href="/Register.aspx">Register</a></li>

        </ul>
         </header>
        
        <div class="contain">
        <div class="contain1" style="margin-left: 15%; padding-top: 20px; padding-right: 10%; max-width: 100%">
            <h1 style="text-align: center; padding-bottom: 30px; padding-top: 30px;">Uploaded&nbsp; Pictures</h1>

   

      <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="gvImages_SelectedIndexChanged1" DataKeyNames="Id" OnRowDeleting="gvImages_RowDeleting" >

    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Image Id" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                    CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
            </ItemTemplate>

            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" />
            </ItemTemplate>
          </asp:TemplateField>

         <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lbl_edit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                <asp:LinkButton ID="lbl_delete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="lbl_update" runat="server" CommandName="Update">Update</asp:LinkButton>
                <asp:LinkButton ID="lbl_cancle" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Download" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
         <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download"  OnClick="DownloadFile"  CommandArgument='<%# Eval("Id") %>'></asp:LinkButton >
               
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
            <div id="dialog" style="display: none">
                
</div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=gvImages] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
    });
</script>
        </div>
            
        </div>
    </form>
</body>
</html>
