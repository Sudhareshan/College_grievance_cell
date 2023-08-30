<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Make_Solve_By_Admin.aspx.cs" Inherits="Collage_Grevance.Make_Solve_By_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title></title>
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
        <h1 id="h1div">Make Sloved Complients</h1>
       Welcome<asp:Label ID="lblUserName"  runat="server"></asp:Label>
    </div>
    <div>
        <form id="form1" runat="server">
           <div class="auto-style1">
             <asp:GridView ID="GridSolve" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" class="table table-hover">
            <Columns>
                <asp:TemplateField HeaderText="Complient Id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("comid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("comid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complient">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Complient") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Complient") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ComplientStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ComplientStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Make Slove Status" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" class="btn btn-primary" runat="server" CausesValidation="false" CommandName="IsSolved" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" Text="Slove" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
        </asp:GridView>
        </div>
            <asp:HyperLink ID="HyperLink1"  runat="server" NavigateUrl="~/AdminPage.aspx">Back</asp:HyperLink>
        </div>
        </form>
    </div>
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>
</body>
</html>
