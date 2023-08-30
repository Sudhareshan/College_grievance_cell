<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="Collage_Grevance.AddMember" %>

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
        .formDiv{
            display:flex;
            justify-content:center;
        }
        #BackDiv{
            display:flex;
            justify-content:left;
            align-items:flex-end;
            font-size:20px;
        }
        .SameAlign{
            height:20px;
            width:150px;
            border-radius:3px;
        }
       /* #BtnSave:hover{
            width:80px;
            height:25px;
            color:white;
            background-color:#3fa1de;
        }*/
         #BtnSave {
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
        #dropRoll,#dropDept{
            width: 292px;
            height:40px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
    </style>
    <script>
        //$(document).ready(function () {
        //    debugger;
        //    $('#BtnSave').click(function (e) {
        //        var isValid = true;
        //        $('#txtName,#txtid').each(function () {
        //            if ($.trim($(this).val()) == '') {
        //                isValid = false;
        //                $(this).css({
        //                    "border": "1px solid red",
        //                    "background": "#FFCECE"
        //                });
        //            }
        //            else {
        //                $(this).css({
        //                    "border": "",
        //                    "background": ""
        //                });
        //            }
        //        });
        //        if (isValid == false)
        //            e.preventDefault();
        //    });
        //});

        function Validate() {

            if (document.getElementById("txtid").value == "") {
               
                alert("Id Required");
                document.getElementById("txtid").focus();
                return false;
            }
            if (document.getElementById("txtName").value == "") {
                alert("Name Required ");
                document.getElementById("txtName").focus();
                return false;

            }
            if (document.getElementById("dropRoll").value == "" || document.getElementById("dropRoll").value == "--Select--" ) {
                alert('!!!!!!! Roll should not be blank');
                document.getElementById("dropRoll").focus();
                return false;
            }

            if (document.getElementById("dropDept").value == "" || document.getElementById("dropDept").value == "--Select--") {
                alert('!!!!!!! Department should not be blank');
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
        <h1 id="h1div">Add Member by Admin</h1>
       Welcome<asp:Label ID="lblUserName"  runat="server"></asp:Label>
    </div>
    <div class="formDiv">
        <div id="BackDiv">
            <asp:HyperLink ID="hypBack" runat="server" NavigateUrl="~/AdminPage.aspx">Back</asp:HyperLink>
        </div>
         
        <form id="form1" runat="server">
           <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                   
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Enter Id Number</td>
                <td>
                    <asp:TextBox CssClass="SameAlign" ID="txtid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Enter Name</td>
                <td>
                    <asp:TextBox CssClass="SameAlign" ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Select Roll</td>
                <td>
                    <asp:DropDownList CssClass="SameAlign" ID="dropRoll" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Select Department</td>
                <td>
                    <asp:DropDownList CssClass="SameAlign" ID="dropDept" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" OnClientClick="return  Validate()" Text="Submit" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </form>
    </div>
    <div class="CopyDiv">
        <label id="CopyDiv">©Copyright 2023,All rights reserved. Antra Info Tech</label>
    </div>
</body>
</html>
