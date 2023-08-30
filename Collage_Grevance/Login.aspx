<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Collage_Grevance.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style type="text/css">
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f2f2f2;
        }

        .login-container {
            background-color: white;
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

        #btnLogin {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            #btnLogin:hover {
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
        $(document).ready(function () {
            $('#btnLogin').click(function (e) {
                var isValid = true;
                $('#txtUname,#txtPwd').each(function () {
                    if ($.trim($(this).val()) == '') {
                        isValid = false;
                        alert("Should not be empty")
                        $(this).css({
                            "border": "1px solid red",
                            "background": "#FFCECE"
                        });
                    }
                    else {
                        $(this).css({
                            "border": "",
                            "background": ""
                        });
                    }
                });
                if (isValid == false)
                    e.preventDefault();

            });
        });
    </script>
</head>
<body>
    <div class="login-container">
        
        <h1>Login</h1>
        
        <form id="form1" runat="server">



            <div>



            <asp:Label runat="server" ID="lblUname" Font-Size="Large" Text="Enter User Id"></asp:Label>
            <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
            <asp:Label runat="server" ID="lblPwd" Font-Size="Large" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
            <asp:HyperLink ID="HypRegister" runat="server" NavigateUrl="~/Regitraion.aspx">SignUp ?</asp:HyperLink>

            <script src="script.js"></script>


            </div>


        </form>
    </div>
</body>
</html>
