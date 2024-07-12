<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="anasayfa.aspx.vb" Inherits="WebApplicationArer.anasayfa" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/STYLE1.css" rel="stylesheet" />
    <script src="JS/bootstrap.min.js"></script>
    <title>ARER BAKIM</title>
    <style>
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10002;
            background: rgba(0, 0, 0, 0.7);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .popup-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.7);
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-width: 700px;
            width: 100%;
            text-align: center;
            z-index: 10002;
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .close-btn {
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
        }

        .popup-trigger {
            color: #fff; 
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-size: 12px;
            z-index: 1;
            padding: 5px 20px;
            display: inline-block;
            background: #f87c1d;
            border-radius: 5px;
        }

            .popup-trigger:hover {
                color: #555; 
            }

        .stokeklebtn {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            padding: 5px 20px;
            height: 40px;
            width: 80%;
            display: inline-block;
            background: #f87c1d;
            border-radius: 5px;
            outline: none;
            border: none;
            top: 10px;
            margin: 10px auto;
            cursor: pointer;
        }

            .stokeklebtn:hover {
                color: #555;
            }

        .stoksilbtn {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            padding: 6px 20px;
            display: inline-block;
            background: red;
            font-size: 12px;
            border-radius: 5px;
            border: none;
            outline: none;
            z-index: 1;
            cursor: pointer;
        }

            .stoksilbtn:hover {
                color: #555;
            }

        .eladio {
            display: grid;
            height: 100%;
            width: 100%;
            grid-template-columns: repeat(1, 1fr);
            text-align: center;
            align-items: center;
            justify-content: center;
            margin: auto;
            line-height: 2rem;
            box-sizing: border-box;
        }

        .buttoncontainer {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            justify-self: end;
        }

        .denemecontainer {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            width: 100%;
        }

        .anagrid {
            width: calc(100%);
        }

        .popup-trigger1 {
            color: #fff; 
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-size: 12px;
            z-index: 1;
            padding: 5px 20px;
            display: none;
            background: #f87c1d;
            border-radius: 5px;
            cursor: pointer;
        }

            .popup-trigger1:hover {
                color: #555;
            }

        @media only screen and (min-width: 315px) {
            .popup-container {
                width: 80%; 
            }
        }

        @media only screen and (min-width: 420px) {
            .popup-container {
                width: 80%; 
            }
        }

        @media only screen and (max-width: 565px) {
            .popup-container {
                width: 80%; 
            }

            /*            .denemecontainer {
                grid-template-columns: repeat(1, 1fr);
            }*/
        }

        @media only screen and (max-width: 960px) {
            .popup-container {
                width: 80%; 
            }

            .buttoncontainer {
                grid-template-columns: repeat(1, 1fr);
            }

            .popup-trigger {
                display: none;
            }

            .popup-trigger1 {
                display: inline-block;
            }
        }

        @media only screen and (min-width: 768px) {
            .popup-container {
                width: 80%; 
            }
        }

        @media only screen and (min-width: 1200px) {
            .popup-container {
                width: 80%; 
            }
        }

        #FileUpload1 {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        #CustomButton {
            background-color: #f87c1d; 
            color: white;
            width: 47%;
            height: 43px;
            padding: 10px 15px;
            cursor: pointer;
            border: none;
            left: 0;
            margin-right: 10px;
            border-radius: 5px;
        }

            #CustomButton:hover {
                color: #555;
            }

        #FileLabel {
            margin-top: 10px;
        }

        #FileUpload2 {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        /* Özel stil eklenmiş buton */
        #CustomButton2 {
            background-color: #f87c1d; /* Özel buton rengi */
            color: white;
            width: 47%;
            height: 43px;
            padding: 10px 15px;
            cursor: pointer;
            border: none;
            left: 0;
            margin-right: 10px;
            border-radius: 5px;
        }

            #CustomButton2:hover {
                color: #555;
            }

        #FileLabel2 {
            margin-top: 10px;
        }

        #FileUpload3 {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        #CustomButton3 {
            background-color: #f87c1d;
            color: white;
            width: 47%;
            height: 43px;
            padding: 10px 15px;
            cursor: pointer;
            border: none;
            left: 0;
            margin-right: 10px;
            border-radius: 5px;
        }

            #CustomButton3:hover {
                color: #555;
            }

        #FileLabel3 {
            margin-top: 10px;
        }

        .silcontainer {
            display: grid;
            width: 100%;
            margin: 0;
            padding: 15px;
            grid-template-columns: repeat(2, 1fr);
        }

        .popup-trigger_new {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-size: 12px;
            z-index: 1;
            padding: 5px 20px;
            display: inline-block;
            background: #f87c1d;
            border-radius: 5px;
        }

            .popup-trigger_new:hover {
                color: #555;
            }

        .btn btn-secondary {
            background-color: #f87c1d;
            color: #555;
        }

        .profil {
            position: absolute;
            right: 20px;
            display: inline-block;
        }

            .profil img {
                width: 40px;
                height: 40px; 
                cursor: pointer;
            }

        .profil-liste {
            display: none;
            border-radius: 10px;
            position: absolute;
            right: -10px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 5px;
            font-size: small;
            list-style-type: none;
            z-index: 1;
            animation: openList 0.2s ease-in-out forwards;
        }

        @keyframes openList {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profil-liste.goster {
            display:block;
            /*animation: closeList 0.3s ease-in-out forwards;*/
        }

        .profil-liste li {
            margin-bottom: 5px;
        }
    </style>

    <script type="text/javascript">

        function OnRowSelectionChanged(s, e) {
            s.GetSelectedFieldValues("makkod;islem_acan;baslik;aciklama", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {

            var fieldValues = values[0].slice(',');

            document.getElementById("<%= guncellemakkod.ClientID %>").value = fieldValues[0];
            document.getElementById("<%= guncelleislemacan.ClientID %>").value = fieldValues[1];
            document.getElementById("<%= guncellebaslik.ClientID %>").value = fieldValues[2];
            document.getElementById("<%= guncelleaciklama.ClientID %>").value = fieldValues[3];
        }

    </script>
</head>
<body>
    <form runat="server" id="form1">
        <!-- sidebar -->
        <section id="sidebar">
            <a href="#" class="brand">ARER BAKIM</a>
            <ul class="side-menu">
                <%--<li><a href="anasayfa.aspx"><i class='bx bxs-home icon'></i>ANA SAYFA</a></li>--%>
                <li><a href="anasayfa.aspx" class="active"><i class='bx bxs-error icon'></i>Arıza</a></li>
                <li class="divider" data-text="STOK">STOK</li>
                <li>
                    <a href="#"><i class='bx bxs-inbox icon'></i>STOK <i class='bx bx-chevron-right icon-right'></i></a>
                    <ul class="side-dropdown">
                        <li><a href="Stok.aspx">Stok Ana</a></li>
                        <li><a href="StokHareket.aspx">Stok Hareketleri</a></li>
                    </ul>
                </li>
                <li class="divider" data-text="SAYAÇLAR">SAYAÇLAR</li>
                <li><a href="Sayaclar.aspx"><i class='bx bxs-tachometer icon'></i>Sayaçlar</a></li>
                <li class="divider" data-text="PERİYODİK">PERİYODİK BAKIMLAR</li>
                <li><a href="periyodik.aspx"><i class='bx bxs-time-five icon'></i>Periyodik Bakımlar</a></li>
            </ul>
        </section>
        <!-- sidebar -->
        <%--        <dx:ASPxGridView runat="server" ID="ASPxGridView1"></dx:ASPxGridView>--%>
        <!-- NAVBAR -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu toggle-sidebar' id="menuac"></i>
                <span class="divider"></span>

                <div class="profil" onclick="toggleList()">
                    <img src="Images/profile.png" alt="Profil İkonu" />
                    <ul id="profil-liste" class="profil-liste">
                        <li><asp:LinkButton runat="server" ID="ayarlarbuton" OnClick="ayarlarbuton_Click" Text="Ayarlar" ForeColor="#f87c1d"></asp:LinkButton></li>
                        <li><asp:LinkButton runat="server" ID="cikisyap" OnClick="cikisyap_Click" Text="Çıkış" ForeColor="#f87c1d"></asp:LinkButton></li>
                    </ul>
                </div>
            </nav>
            <!-- NAVBAR -->
            <asp:SqlDataSource runat="server" ID="SqlDataSource2"></asp:SqlDataSource>
            <!-- POPUP -->

            <div class="popup-overlay" id="popupOverlay2" onclick="closePopup('popupOverlay2')">
                <div class="popup-container" id="popupContainer2" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay2')">&times;</span>
                    <h2>KAYIT SİL</h2>
                    <div class="silcontainer">
                        <asp:Button runat="server" ID="silbuton" CssClass="stokeklebtn" Text="SİL" Style="background-color: red; margin: 5px auto; width: 80%;" OnClick="silbuton_Click" />
                        <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="closePopup('popupOverlay6')">VAZGEÇ</a>
                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay3" onclick="closePopup('popupOverlay3')">
                <div class="popup-container" id="popupContainer3" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay3')">&times;</span>
                    <h2>İŞLEM SEÇ</h2>

                    <div class="eladio">
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay1')">YENİ</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay4')">İŞLEM</a>
                        <%--<a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay2')">GÜNCELLE</a>--%>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay2')">Sil</a>
                        <a href="ArizaIslemler.aspx" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;">İŞLEMLER</a>
                        <a href="ArizaMalzemeler.aspx" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;">MALZEMELER</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay5')">AKTAR</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay6')">GÜNCELLE</a>
                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay4" onclick="closePopup('popupOverlay4')">
                <div class="popup-container" id="popupContainer4" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay4')">&times;</span>
                    <h2>İŞLEM</h2>

                    <div class="eladio">
                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="file-upload" onchange="updateButtonText2()" AllowMultiple="false" />

                            <button type="button" id="CustomButton2" onclick="document.getElementById('FileUpload2').click()">Dosya Seç</button>

                            <asp:Label ID="FileLabel2" runat="server" />
                        </div>
                        <h6>İşlem Tarihi</h6>
                        <asp:TextBox ID="TextBox6" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <!-- Diğer Stok ekleme için form veya içerik buraya eklenebilir -->
                        <asp:TextBox runat="server" ID="TextBox7" placeholder="Başlık giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="TextBox8" placeholder="İşlem yapan Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <%--<asp:TextBox runat="server" ID="TextBox9" placeholder=" Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>--%>
                        <asp:TextBox TextMode="MultiLine" runat="server" ID="TextBox10" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <h6 id="sonuctarihibaslik" style="display: none;">Sonuç Tarihi</h6>
                        <asp:TextBox ID="TextBox11" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px; display: none"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="Sonuctur" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Sonuçlandı" Value="Sonuçlandı" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Sonuçlanmadı" Value="Sonuçlanmadı" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="islem_ekle" OnClick="islem_ekle_Click" CssClass="stokeklebtn" Text="İŞLEM EKLE" Style="background-color: green;" />
                        <%--<asp:Button runat="server" ID="Button2" OnClick="Stokcikar_Click" CssClass="stokeklebtn" Text="STOK ÇIKAR" style="background-color:red;"/>--%>
                        <%--<asp:Button runat="server" ID="StokIade" OnClick="StokIade_Click" CssClass="stokeklebtn" Text="İADE"/>--%>
                        <asp:Label runat="server" ID="Label3" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay5" onclick="closePopup('popupOverlay5')">
                <div class="popup-container" id="popupContainer5" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay5')">&times;</span>
                    <h2>DIŞA AKTAR</h2>
                    <div class="silcontainer">
                        <asp:Button runat="server" ID="excelaktar" CssClass="stokeklebtn" Text="EXCEL" Style="background-color: green; margin: 5px auto; width: 80%;" OnClick="excelaktar_Click" />
                        <asp:Button runat="server" ID="pdfaktar" CssClass="stokeklebtn" Text="PDF" Style="background-color: red; margin: 5px auto; width: 80%;" OnClick="pdfaktar_Click" />
                    </div>
                </div>
            </div>

            <%--GÜNCELLEME İÇİN POPUP--%>

            <div class="popup-overlay" id="popupOverlay6" onclick="closePopup('popupOverlay6')">
                <div class="popup-container" id="popupContainer6" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
                    <h2>GÜNCELLE</h2>
                    <div class="eladio">

                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload3" runat="server" CssClass="file-upload" onchange="updateButtonText3()" AllowMultiple="false" />

                            <button type="button" id="CustomButton3" onclick="document.getElementById('FileUpload3').click()">Dosya Seç</button>

                            <asp:Label ID="FileLabel3" runat="server" />
                        </div>

                        <h6>Arıza tarihi</h6>
                        <asp:TextBox ID="guncelledate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <h6>Planlı tarih</h6>
                        <asp:TextBox ID="guncelleplandate" type="date" runat="server" CssClass="datepicker" placeholder="Plan Tarihi seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="guncellemakkod" placeholder="Makine kodu Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelleislemacan" placeholder="İşlem açan Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncellebaslik" placeholder="Başlık Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelleaciklama" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="guncellearizatur" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Arıza" Value="Arıza" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Bakım" Value="Bakım" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="guncelletype" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Mekanik" Value="Mekanik" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Elektronik" Value="Elektronik" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="guncellebtn" CssClass="stokeklebtn" Text="GÜNCELLE" OnClick="guncellebtn_Click" />
                        <asp:Label runat="server" ID="guncellewarning" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>

                    </div>
                </div>
            </div>

            <%--GÜNCELLEME İÇİN POPUP BİTİŞİ--%>

            <%--ARIZA EKLEME İÇİN POPUP--%>

            <div class="popup-overlay" id="popupOverlay1" onclick="closePopup('popupOverlay1')">
                <div class="popup-container" id="popupContainer1" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay1')">&times;</span>
                    <h2>Arıza</h2>

                    <div class="eladio">

                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" onchange="updateButtonText()" AllowMultiple="false" />

                            <button type="button" id="CustomButton" onclick="document.getElementById('FileUpload1').click()">Dosya Seç</button>

                            <asp:Label ID="FileLabel" runat="server" />
                        </div>

                        <h6>Arıza tarihi</h6>
                        <asp:TextBox ID="txtarizaDate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <h6>Planlı tarih</h6>
                        <asp:TextBox ID="txtplanDate" type="date" runat="server" CssClass="datepicker" placeholder="Plan Tarihi seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="makkodentry" placeholder="Makine kodu Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="islemacanentry" placeholder="İşlem açan Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="baslikentry" placeholder="Başlık Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="aciklamaentry" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <h6>Tür Seçiniz</h6>
                        <asp:TextBox runat="server" ReadOnly="true" ID="arizadidentry" placeholder="Arıza ID Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;" Visible="false"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="Arizatur" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Arıza" Value="Arıza" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Bakım" Value="Bakım" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="typeentry" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Mekaniksel" Value="Mekaniksel" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Elektriksel" Value="Elektriksel" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Operatör hatası" Value="Operatör hatası" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="ariza_akle" CssClass="stokeklebtn" OnClick="ariza_akle_Click" Text="ARIZA EKLE" />
                        <asp:Label runat="server" ID="uyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>

            <%--ARIZA EKLEME İÇİN POPUP BİTİŞİ--%>
            <!--POPUP -->

            <!-- MAIN -->
            <main style="height: 100vh;">

                <%--<div class="info-data">
				<div class="card">
					<div class="head">
						<div>
							<h2><asp:Label runat="server" ID="girenstoklabel"></asp:Label></h2>
							<p>GİREN</p>
						</div>
						<i class='bx bx-trending-up icon' ></i>
					</div>
				</div>
				<div class="card">
					<div class="head">
						<div>
							<h2><asp:Label runat="server" ID="cikanstoklabel"></asp:Label></h2>
							<p>ÇIKAN</p>
						</div>
						<i class='bx bx-trending-down icon down' ></i>
					</div>
				</div>
			</div>--%>
                <asp:Label runat="server" ID="arizaturulabel" Visible="false"></asp:Label>
                <asp:Label runat="server" ID="dosyakayitdeneme"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="data" style="height: 100%;">
                    <div class="content-data" style="height: 100%; overflow-y: scroll;">
                        <div class="head">
                            <div class="denemecontainer">
                                <h3 style="color: #f87c1d;">ARIZA</h3>
                                <div class="buttoncontainer">
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay1')">Arıza</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay4')">İşlem</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay2')">Sil</a>
                                    <a href="ArizaIslemler.aspx" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;">İşlemler</a>
                                    <a href="ArizaMalzemeler.aspx" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px;">Malzeme</a>
                                    <a href="#" class="popup-trigger1" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay3')">SEÇ</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay5')">AKTAR</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay6')">GÜNCELLE</a>
                                </div>
                            </div>
                        </div>


                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%" CssClass="anagrid">
                            <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>

                            <SettingsSearchPanel Visible="False" />

                            <%-- <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" ShowHeaderFilterButton="True" />--%>

                            <Styles AdaptiveDetailButtonWidth="14">
                                <Header Font-Names="Arial Black" Font-Size="7pt" Wrap="True" BackColor="White"></Header>
                                <SelectedRow BackColor="#F87C1D" ForeColor="White"></SelectedRow>
                            </Styles>
                            <ClientSideEvents SelectionChanged="OnRowSelectionChanged" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                                AllowHideDataCellsByColumnMinWidth="true">
                            </SettingsAdaptivity>
                            <SettingsPager Mode="ShowAllRecords" />

                            <SettingsBehavior AllowEllipsisInText="true" AllowFocusedRow="True" AllowSelectByRowClick="True" ProcessFocusedRowChangedOnServer="True" AllowSelectSingleRowOnly="true" />
                            <SettingsPopup>
                                <HeaderFilter PopupAnimationType="Slide">
                                </HeaderFilter>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>

                            <Columns>
                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" Caption="Düzenle">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="2" Caption="ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ariza_id" VisibleIndex="3" Caption="Arıza ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="tarih" VisibleIndex="1" Caption="Tarih" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ariza_turu" VisibleIndex="4" Caption="Arıza Türü" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="makkod" VisibleIndex="5" Caption="Makine Kodu" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="islem_acan" VisibleIndex="8" Caption="İşlem açan">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="baslik" VisibleIndex="9" Caption="Başlık">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="aciklama" VisibleIndex="18" Caption="Açıklama">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="dosya" VisibleIndex="11" Caption="Dosya" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sonuc" VisibleIndex="12" Caption="Sonuç" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sonuc_dosya" VisibleIndex="13" Caption="Sonuç Dosyası" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sonuc_bitiren" VisibleIndex="14" Caption="Bitiren" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="durum" VisibleIndex="10" Caption="Durum">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sonuc_tarih" VisibleIndex="17" Caption="Sonuç Tarihi">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="gecen_zaman" VisibleIndex="15" Caption="Süre">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="islem_adet" VisibleIndex="16" Caption="İşlem Adeti">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="plan_tarih" VisibleIndex="19" Caption="Plan Tarihi">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ariza_id" VisibleIndex="20" Caption="Arıza ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="son_islem_yapan" VisibleIndex="21" Caption="Son işlem yapan" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="type" VisibleIndex="22" Caption="Tür" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="firma_id" VisibleIndex="22" Caption="Firma ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sil_durum1" VisibleIndex="23" Caption="Sil" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Dosya" FieldName="dosya" VisibleIndex="24">
                                    <PropertiesHyperLinkEdit NullDisplayText="Dosya Eklenmedi">
                                    </PropertiesHyperLinkEdit>
                                    <HeaderStyle Font-Bold="True" ForeColor="#F87C1D" />
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>

                            <Styles>
                                <Header Wrap="True" BackColor="White" Font-Names="Arial Black" Font-Size="7pt"></Header>

                                <SelectedRow BackColor="#F87C1D" ForeColor="White">
                                </SelectedRow>
                            </Styles>
                            <Paddings Padding="0px" />
                            <Border BorderWidth="0px" />
                            <BorderBottom BorderWidth="1px" />
                        </dx:ASPxGridView>
                        <dx:ASPxGridViewExporter runat="server" GridViewID="ASPxGridView1" ID="gridExporter"></dx:ASPxGridViewExporter>
                    </div>
                </div>

                <%--                <asp:HyperLink ID="dosyayiac" runat="server" Target="_blank" NavigateUrl='<%# Eval("DosyaYolu") %>' Text="Dosyayı Görüntüle" Visible='<%# Not String.IsNullOrEmpty(Eval("DosyaYolu").ToString()) %>'></asp:HyperLink>--%>
            </main>
            <%--<asp:Image runat="server" ID="resim"/>--%>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="JS/JS1.js"></script>

        <%--          <script type="text/javascript">
              // <![CDATA[
              ASPxClientControl.GetControlCollection().ControlsInitialized.AddHandler(function (s, e) {
                  UpdateGridHeight();
              });
              ASPxClientControl.GetControlCollection().BrowserWindowResized.AddHandler(function (s, e) {
                  UpdateGridHeight();
              });
        // ]]>
          </script>--%>
        <asp:HiddenField runat="server" ID="selectedSonuc" />
        <asp:HiddenField runat="server" ID="selectedAriza" />
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>

        //var menu1 = document.getElementById("menuac");
        //menu1.addEventListener("click", function () {
        //    var sidemenu = document.getElementById("sidebar");

        //    if (sidemenu.classList.contains("hide")) {
        //        sidemenu.classList.remove("hide");
        //    }
        //    else {
        //        sidemenu.classList.add("hide")
        //    }
        //});


        //document.addEventListener("DOMContentLoaded", function () {

        //    var side = document.getElementById("sidebar");
        //    side.classList.add("hide");

        //});

        function toggleList() {
            var liste = document.getElementById('profil-liste');
            liste.classList.toggle('goster');
        }

        function updateButtonText() {
            var fileUpload = document.getElementById('FileUpload1');
            var customButton = document.getElementById('CustomButton');
            var fileLabel = document.getElementById('<%= FileLabel.ClientID %>'); 

            if (fileUpload.files.length > 0) {
                
                customButton.innerText = 'Dosya Seçildi';
                
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                
                customButton.innerText = 'Dosya Seç';
              
                fileLabel.innerText = '';
            }
        }

        function updateButtonText2() {
            var fileUpload = document.getElementById('FileUpload2');
            var customButton = document.getElementById('CustomButton2');
            var fileLabel = document.getElementById('<%= FileLabel2.ClientID %>'); 

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                customButton.innerText = 'Dosya Seç';
                fileLabel.innerText = '';
            }
        }

        function updateButtonText3() {
            var fileUpload = document.getElementById('FileUpload3');
            var customButton = document.getElementById('CustomButton3');
            var fileLabel = document.getElementById('<%= FileLabel3.ClientID %>');

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                customButton.innerText = 'Dosya Seç';
                fileLabel.innerText = '';
            }
        }


        function openPopup(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);
        }

        function openPopup2(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);
            closePopup('popupOverlay3');
        }

        function closePopup(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.opacity = 0;
            popupContainer.style.opacity = 0;

            setTimeout(function () {
                popupOverlay.style.display = 'none';
            }, 300);
        }
    </script>
</body>
</html>
