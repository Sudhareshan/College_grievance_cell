<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Remove_Admin.aspx.cs" Inherits="Collage_Grevance.Remove_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            display: flex;
            justify-content: center;
            padding:70px;
        }

        #BackDiv {
            display: flex;
            justify-content: left;
            align-items: flex-end;
            font-size: 20px;
        }

        .SameAlign {
            display:flex;
            justify-content:center;
            height: 20px;
            width: 150px;
            border-radius: 3px;
        }

         #btndelete {
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
         #DropRolls{
            width: 292px;
            height:40px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
    </style>
    <script>
        function Validate() {

            if (document.getElementById("txtid").value == "") {

                alert("Id Required");
                document.getElementById("txtid").focus();
                return false;
            }
           
            if (document.getElementById("DropRolls").value == "" || document.getElementById("dropRoll").value == "--Select--") {
                alert('!!!!!!! Roll should not be blank');
                document.getElementById("dropRoll").focus();
                return false;
            }

           
            else {
                alert('Successfull .......!!!')
            }
        }

    </script>
</head>
<body>
     <div id="MainDiv">
        <h1 id="h1div">Welcome to Admin Page</h1>
       Welcome<asp:Label ID="lblUserName"  runat="server"></asp:Label>
    </div>
    <div class="formDiv">
        <form id="form1" runat="server">
            <asp:Label runat="server" Font-Size="Large" CssClass="SameAlign" ID="lblid" Text="Enter ID"></asp:Label>
            <br />
            <asp:TextBox ID="txtid" CssClass="SameAlign" runat="server"></asp:TextBox>
            <br />
            <asp:Label runat="server" Font-Size="Large" CssClass="SameAlign" ID="lblRoll" Text="Select Roll"></asp:Label><br />
             <asp:DropDownList ID="DropRolls" runat="server">
                    </asp:DropDownList> <br />
            <asp:Button ID="btndelete"  runat="server" OnClick="btndelete_Click" OnClientClick="return Validate()" Text="Delete" />
        </form>
    </div>
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>
     
</boby>
</html>
