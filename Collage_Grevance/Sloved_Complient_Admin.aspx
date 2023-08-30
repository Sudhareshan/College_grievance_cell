<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sloved_Complient_Admin.aspx.cs" Inherits="Collage_Grevance.Sloved_Complient_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <style type="text/css">
    
       
        #MainDiv {
            background-color: #3fa1de;
            height: 120px;
        }
        #lblUserName{
            color:white;
            font-size:25px;
            padding:0px;
            display:flex;
            padding-left: 120px;
            
        }
        #h1div{
            display:flex;
            justify-content:center;
            color:white;
        }
        .hyClass{
            display:flex;
            justify-content:center;
            padding:15px;
            font-size:25px;
        }
        .hyClass:hover{
            font-size:30px;
            color:#654ea3;
        }
        .CopyDiv{
            background-color:#282927;
            text-align:center;
            color:white;
            height:50px;
            display:flex;
            justify-content:center;
            padding:45px;
            font-size:25px;
        }
    </style>
</head>
<body>
      <div id="MainDiv">
        <h1 id="h1div">View All Sloved Complients</h1>
       Welcome<asp:Label ID="lblUserName"  runat="server"></asp:Label>
    </div>
    <div>
        <form id="form1" runat="server">
           <div class="auto-style1">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-hover">
                <Columns>
                    <asp:TemplateField HeaderText="Complient">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complient") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Complient") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status ">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ComplientStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ComplientStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
            <asp:HyperLink ID="HyperLink1"  runat="server" NavigateUrl="~/AdminPage.aspx">Back</asp:HyperLink>
        </div>
      
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>
     
</body>
</html>
