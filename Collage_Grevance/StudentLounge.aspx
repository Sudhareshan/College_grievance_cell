<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLounge.aspx.cs" Inherits="Collage_Grevance.StudentLounge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title></title>
    <style type="text/css">
        

       /* #MainDiv {
            background-color: #3fa1de;
            height: 120px;
        }
*/
        .Maindivclass {
            background-color: #6d41a1;
            height: 120px;
        }

        #lblGreatings {
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

        .formDiv {
            height: 400px;
            display: flex;
            justify-content: center;
        }

        #BackDiv {
            display: flex;
            justify-content: left;
            align-items: flex-end;
            font-size: 20px;
        }

        .SameAlign {
            height: 20px;
            width: 150px;
            border-radius: 3px;
        }
        /* #btnShow,#BtnSeachComp:hover{
            width:150px;
            height:30px;
            color:white;
            background-color:#3fa1de;
        }*/
        #btnShow, #BtnSeachComp,#btnSaveComplanit {
            width: 100%;
            padding: 10px;
            background-color: #3fa1de;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="text"] {
            width: 274px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        #DropDepts, #txtComplaint {
            width: 292px;
            height: 40px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
      
    </style>
    <script>
        function Validate() {

            if (document.getElementById("txtComplaint").value == "") {
                alert("  Complaint Required ");
                document.getElementById("txtComplaint").focus();
                return false;

            }


            if (document.getElementById("DropDepts").value == "" || document.getElementById("dropDept").value == "--Select--") {
                alert('!!!!!!! Department should not be blank');
                document.getElementById("dropRoll").focus();
                return false;
            }
        }

    </script>
</head>
<body>
    <div id="MainDiv" class="Maindivclass">
        <h1 id="h1div">Student Complient Page</h1>
        Welcome   
        <asp:Label ID="lblGreatings" runat="server"></asp:Label>
    </div>
    <div class="formDiv">
        <div id="BackDiv">
        </div>

        <form id="form1" runat="server">
            <div class="auto-style8">
                <p class="auto-style1">

                    <table>
                        <tr>
                            <td class="auto-style3"></td>
                            <td class="auto-style6">
                                <div>
                                    <asp:Button ID="btnShow" runat="server" Text="Rise a Complaint" OnClick="btnShow_Click" /><br />
                                </div>
                                <div>
                                    <br />
                                </div>
                                <div>
                                    <asp:Button ID="BtnSeachComp" runat="server" OnClick="BtnSeachComp_Click" Text="Complaint Status" />
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style6">
                                <strong>
                                    <asp:Label ID="lblcomplient" runat="server" Text=" Mention  Complaints in Below Box" Visible="False"></asp:Label></strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="lblComplinetOn" runat="server" Text="Complaint On" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="DropDepts" runat="server" Visible="False">
                                </asp:DropDownList>
                                <asp:Label ID="lblcid" runat="server" Text="Complain ID" Visible="False"></asp:Label>
                                <asp:TextBox ID="txtCid" runat="server" AutoPostBack="True" OnTextChanged="txtCid_TextChanged" Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <p class="auto-style4">
                        <asp:Label runat="server" ID="txtarea" Text="Rise Complient"></asp:Label>
                        <textarea id="txtComplaint" runat="server" visible="false" aria-multiline="False" aria-orientation="horizontal" cols="20" dir="auto" name="S1" rows="10" class="auto-style5"></textarea>
                        <asp:Button ID="btnSaveComplanit" runat="server"   OnClick="btnSaveComplanit_Click" OnClientClick="return  Validate()" Text="Submit" Visible="False" />
                    </p>
                    <table class="table table-hover">
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:GridView ID="GridView1" class="table table-borderless table-dark" runat="server" Visible="False" >
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                  <strong>  <asp:HyperLink ID="hypLogout" runat="server" NavigateUrl="~/Logout.aspx">LogOut</asp:HyperLink></strong>
            </div>
        </form>
    </div>
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>
</body>
</html>
