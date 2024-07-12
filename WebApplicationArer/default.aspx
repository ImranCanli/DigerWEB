<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebApplicationArer._default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet' />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/STYLE1.css" rel="stylesheet" />
    <script src="JS/bootstrap.min.js"></script>
    <title></title>
    <style>
        body {
            background: #f87c1d;
        }

        .centered-div {
            width: 100%;
            height: 40vh; 
            background-color: white; 
            position: absolute;
            top: 50%; 
            left: 50%; 
            transform: translate(-50%, -50%);
        }

        .stretched-div {
            width: 70%; 
            height: 100vh; 
            background-color: white; 
            position: absolute; 
            top: 0; 
            left: 30%; 
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1); 
            display: flex; 
            justify-content: center;
            align-items: center;

        }

        .remaining-content {
            padding: 20px;
            width: 30%; 
            height: 100vh; 
            background-color: #f0f0f0; 
            position: absolute; 
            top: 0; 
            left: 0;
            overflow-y: auto;
            overflow-x:hidden;
            background: #f87c1d;
            box-shadow: -5px 5px 15px rgba(0, 0, 0, 0.1);
            overflow-y:hidden;
        }

        .centered-content {
            z-index:1000;
            background-color: white; 
            padding: 20px; 
            width:80%;
            height:50vh;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.4);
            border-radius: 18px;
        }
        .entry{
            border: 2px solid rgba(0, 0, 0, 0.2);
            width: 80%;
            margin: 20px auto;
            border-radius: 5px;
            height:40px;
            font-size:12px;
            padding: 15px;
        }
        .gobuton{
            border-radius: 10px;
            width: 80%;
            height: 50px;
            color:white;
            background:#f87c1d;
            border:none;
            outline:none;
            letter-spacing:4px;
            margin: auto;
            margin-top: 40px;
        }
        .gobuton:hover{
            color:#606263;
            background: #fc7435;
        }
        .ortala{
            display:grid;
            grid-template-columns: repeat(1, 1fr);

        }
        @media only screen and (max-width: 530px){
           
            .centered-content{

                position: absolute;
                top: 50%;
                left: 30%;
                transform: translate(-50%, -50%);
                min-width: 270px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="stretched-div">
        <div class="centered-content">
            <div class="ortala">
            <asp:TextBox CssClass="entry" runat="server" ID="kullaniciadientry" placeholder="Kullanıcı Adı girin"></asp:TextBox>
            <asp:TextBox CssClass="entry" runat="server" ID="sifreentry" placeholder="Şifre Giriniz" type="password"></asp:TextBox>
            <asp:Button runat="server" ID="gobutton" CssClass="gobuton" Text="GİRİŞ" OnClick="gobutton_Click"/>
            <asp:Label runat="server" ID="uyarilabel" style="color:red; margin:auto;"></asp:Label>
            </div>
        </div>
        </div>
        <div class="remaining-content">
            <h3 style="color: white">ARER BAKIM</h3>
            <h1 style="color: white">ARER BAKIM</h1>
            <h4 style="color: white">ARER BAKIM</h4>
            <h3 style="color: white">ARER BAKIM</h3>
            <h5 style="color: white">ARER BAKIM</h5>
            <h1 style="color: white">ARER BAKIM</h1>
            <h3 style="color: white">ARER BAKIM</h3>
            <h1 style="color: white">ARER BAKIM</h1>
            <h2 style="color: white; font-size: 50pt">ARER BAKIM</h2>
            <h5 style="color: white">ARER BAKIM</h5>
            <h5 style="color: white; font-size: 40pt">ARER BAKIM</h5>
            <h6 style="color: white; font-size: 25pt">ARER BAKIM</h6>
        </div>
    </form>
</body>
</html>
