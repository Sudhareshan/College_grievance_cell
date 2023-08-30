<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Collage_Grevance.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        <h1 id="h1div">Welcome to Admin Page</h1>
       Welcome<asp:Label ID="lblUserName"  runat="server"></asp:Label>
    </div>
    <div>
        <form id="form1" runat="server">
             <asp:HyperLink CssClass="hyClass" ID="hypAddStudent" runat="server" NavigateUrl="~/AddMember.aspx">Add Members</asp:HyperLink>
            <asp:HyperLink CssClass="hyClass" ID="hypRemove" runat="server" NavigateUrl="~/Remove_Admin.aspx">Remove Members</asp:HyperLink>
            <asp:HyperLink CssClass="hyClass" ID="hypViewCom" runat="server" NavigateUrl="~/View_All_Complints_Admin.aspx">View all complaints</asp:HyperLink>
            <asp:HyperLink CssClass="hyClass" ID="hypSloveCom" runat="server" NavigateUrl="~/Sloved_Complient_Admin.aspx">Solve Complaints</asp:HyperLink>
            <asp:HyperLink CssClass="hyClass" ID="hypmakeSloveAdmin" runat="server" NavigateUrl="~/Make_Solve_By_Admin.aspx">Make Complient Solve</asp:HyperLink>
             <asp:HyperLink CssClass="hyClass" ID="hypLogout" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
        </form>
    </div>
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>
     

</body>
</html>
