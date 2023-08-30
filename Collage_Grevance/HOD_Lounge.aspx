<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOD_Lounge.aspx.cs" Inherits="Collage_Grevance.HOD_Lounge" %>

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

        #lblUserName {
            color: white;
            font-size: 25px;
            padding: 0px;
            display: flex;
            padding-left: 120px;
        }

        #h1div {
            display: flex;
            justify-content: center;
            color: white;
        }

        .hyClass {
            display: flex;
            justify-content: center;
            padding: 15px;
            font-size: 25px;
        }

            .hyClass:hover {
                font-size: 30px;
                color: #654ea3;
            }

        .CopyDiv {
            background-color: #282927;
            text-align: center;
            color: white;
            height: 50px;
            display: flex;
            justify-content: center;
            padding: 45px;
            font-size: 25px;
        }

        #BtnViewAllComp, #btnPendingCom {
            width: 100%;
            padding: 10px;
            background-color: #3fa1de;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
           
        }
        .container{
            height:400px;
            display:flex;
            justify-content:center;
            margin:auto;
            overflow:scroll;
        }
    </style>
</head>
<body>
    <div id="MainDiv">
        <h1 id="h1div">View All Sloved Complients</h1>
        Welcome<asp:Label ID="lblUserName"  ForeColor="White" runat="server"></asp:Label>
    </div>
    <div class="container">
        <form id="form1" runat="server">
            <div class="auto-style1">
                <strong>HOD Lounge
                </strong>
            </div>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="BtnViewAllComp" runat="server" OnClick="BtnViewAllComp_Click" Text="All Complient" />
                    </td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnPendingCom" runat="server" OnClick="btnPendingCom_Click" Text="Pending Complient" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div class="auto-style6">
                <asp:GridView ID="GridAllComp" runat="server" AutoGenerateColumns="False" class="table table-hover" Visible="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Complient">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complient") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Complient") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ComplientStatus">
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
            <div class="auto-style6">
                <asp:GridView ID="GridAllComp0" runat="server" AutoGenerateColumns="False" Visible="False" class="table table-hover" OnRowCommand="GridAllComp0_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="ComId" runat="server" Text='<%#Bind("Comid") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Lblcomid" runat="server" Text='<%# Bind("Comid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Complient">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Complient") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Complient") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ComplientStatus">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ComplientStatus") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ComplientStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Click To Slove">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" class="btn btn-success" CausesValidation="false" CommandName="CmdUpdate" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" Text="Sloved" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

          <strong>  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">LogOut</asp:HyperLink></strong>
    </div>
    </form>
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>

</body>
</html>
