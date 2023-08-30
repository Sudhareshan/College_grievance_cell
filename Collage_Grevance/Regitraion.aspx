<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regitraion.aspx.cs" Inherits="Collage_Grevance.Regitraion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f2f2f2;
            background-image:url("/Images/Reg1.jpg")
        }

        .login-container {
           
            width: 300px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px #888888;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 274px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        #dropRoll{
             width: 299px;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        #BtnRegister {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            #BtnRegister:hover {
                background-color: #45a049;
            }
            #HypRegister{
                display:flex;
                justify-content:end;
                
            }
        #error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
            display: none;
        }
        </style>
     <script>
        function Validate() {

            if (document.getElementById("txtUserid").value == "") {
               
                alert("UserId Required");
                document.getElementById("txtUserid").focus();
                return false;
            }
            if (document.getElementById("txtName").value == "") {
                alert("Name Required ");
                document.getElementById("txtName").focus();
                return false;

            }

            if (document.getElementById("txtDname").value == "") {
                alert("UserName Required ");
                document.getElementById("txtDname").focus();
                return false;

            }
            if (document.getElementById("txtUserName").value == "") {
                alert("Password Required ");
                document.getElementById("txtUserName").focus();
                return false;

            }
            if (document.getElementById("txtPwd").value == "") {
                alert("Email Required ");
                document.getElementById("txtPwd").focus();
                return false;

                var gmailRdx = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
                var gmailText = document.getElementById("txtPwd").value;
                var matchGmail = gmailText.match(gmailRdx);
                if (matchGmail == null) {
                    alert("Incorrect Gmail");
                    document.getElementById("txtPwd").focus();
                    return false;
                }


            }
            if (document.getElementById("txtMobile").value == "") {
                alert("Mobile Number Required ");
                document.getElementById("txtMobile").focus();
                return false;

            }

            var re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
            var PhoneText = document.getElementById("txtMobile").value;
            var matchdata = PhoneText.match(re);
            if (matchdata == null) {
                alert("Incorrect Phone No");
                document.getElementById("txtMobile").focus();
                return false;
            }



            if (document.getElementById("dropRoll").value == "" || document.getElementById("dropRoll").value == "--Select--") {
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
    <div>
         <div class="login-container">
        
        <h1>Restration Form</h1>
     <strong> <hr /></strong>  
        <form id="form1" runat="server">
            <div>
                  <asp:Label runat="server" ID="lblUname" Font-Size="Large" Text="UserId"></asp:Label>
             <asp:TextBox ID="txtUserid" runat="server" CssClass="auto-style5"></asp:TextBox>

                <asp:Label runat="server" ID="Label1" Font-Size="Large" Text="Name"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="auto-style5"></asp:TextBox>

                <asp:Label runat="server" ID="Label2" Font-Size="Large" Text="UserName"></asp:Label>
                 <asp:TextBox ID="txtDname" runat="server"></asp:TextBox>

                <asp:Label runat="server" ID="Label3" Font-Size="Large" Text="Password"></asp:Label>
                  <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style5" TextMode="Password"></asp:TextBox>

                <asp:Label runat="server" ID="Label4" Font-Size="Large" Text="Email"></asp:Label>
                <asp:TextBox ID="txtPwd" runat="server" CssClass="auto-style5"></asp:TextBox>

                <asp:Label runat="server" ID="Label5" Font-Size="Large" Text="Mobile Number"></asp:Label>
                  <asp:TextBox ID="txtMobile" runat="server" CssClass="auto-style5"></asp:TextBox>

                <asp:Label runat="server" ID="Label6" Font-Size="Large" Text="Roll"></asp:Label>
                 <asp:DropDownList ID="dropRoll" runat="server">
                        </asp:DropDownList>
                 <asp:Button ID="BtnRegister" runat="server" CssClass="auto-style5" Text="Register" OnClientClick="return Validate()" OnClick="BtnRegister_Click" />
                  <asp:HyperLink ID="HypLoginBack" runat="server" NavigateUrl="~/Login.aspx">Back</asp:HyperLink>

       


            </div>


        </form>
    </div>
    </div>
    
</body>
</html>
