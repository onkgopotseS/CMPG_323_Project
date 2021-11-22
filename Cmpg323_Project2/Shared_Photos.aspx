<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shared_Photos.aspx.cs" Inherits="Cmpg323_Project2.Shared_Photos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
        .Pager span
        {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 20px;
            margin-right: 3px;
            line-height: 150%;
            border: 1px solid #ccc;
        }
        .Pager a
        {
            text-align: center;
            display: inline-block;
            width: 20px;
            border: 1px solid #ccc;
            color: #fff;
            color: #333;
            margin-right: 3px;
            line-height: 150%;
            text-decoration: none;
        }
        .highlight
        {
            background-color: #FFFFAF;
        }
    </style>
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
              margin-right: 75px;
          }
                       
          .auto-style2 {
              height: 15px;
          }
                       
        </style>
<body>
    
      
      
<
   <form id="form1" runat="server">
    <header class="header1">
        <h1 class="logo">
            <a href="#" style="font-size: xx-large; color: #0099CC;">[ PHOTOALBUM ]</a>
        </h1>
        <ul class="main-nav" id="myTopnav">
             <li><a href="/Login.aspx">Log Out</a></li>
            <li><a href="/Upload.aspx">Upload picture</a></li>
            <li><a href="/Home.aspx">Home</a></li>

        </ul>
         </header>
        
        <div class="contain">
        <div class="contain1" style="margin-left: 15%; padding-top: 20px; padding-right: 10%; max-width: 100%">
            <h1 style="text-align: center; padding-bottom: 30px; padding-top: 30px;">Uploaded&nbsp; Pictures</h1>

   
            
<hr />
             <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Pager.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            GetCustomers(1);
        });
        $("[id*=txtSearch]").live("keyup", function () {
            GetCustomers(parseInt(1));
        });
        $(".Pager .page").live("click", function () {
            GetCustomers(parseInt($(this).attr('page')));
        });
        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };
        function GetCustomers(pageIndex) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/GetFiles",
                data: '{searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }
        var row;
        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var files = xml.find("Files");
            if (row == null) {
                row = $("[Id*=gvImages] tr:last-child").clone(true);
            }
            $("[Id*=gvImages] tr").not($("[Id*=gvImages] tr:first-child")).remove();
            if (files.length > 0) {
                $.each(files, function () {
                    var employee = $(this);
                    $("td", row).eq(0).html($(this).find("Id").text());
                    $("td", row).eq(1).html($(this).find("Name").text());
                    $("td", row).eq(2).html("<img src='" + $(this).find("Image").text() + "' alt='" + $(this).find("Name").text() + "' height='100px' width='100px' />");
                    $("[Id*=gvImages]").append(row);
                    row = $("[Id*=gvImages] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");
                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                $(".Name").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[Id*=gvImages]").append(empty_row);
            }
        };
    </script>

    Search:
    <asp:TextBox ID="txtSearch" runat="server" />
    <hr />
    
    <br />
    <div class="Pager">
    </div>
<hr />
      <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"  DataKeyNames="Id" OnRowDeleting="gvImages_RowDeleting" CellSpacing="10" CssClass="auto-style1" Height="16px" PageSize="5" Width="627px" >

    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Image Id"/>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        
        <asp:TemplateField HeaderText="Image">

            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" />
            </ItemTemplate>
            

            <ItemStyle Width="200px" />
          </asp:TemplateField>

         <asp:TemplateField>
            <ItemTemplate>
                
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edittt">Edit</asp:LinkButton>
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

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
