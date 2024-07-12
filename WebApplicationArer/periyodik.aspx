<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="periyodik.aspx.vb" Inherits="WebApplicationArer.periyodik" %>

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
            grid-template-columns: repeat(4, 1fr);
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

        #CustomButton2 {
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
            s.GetSelectedFieldValues("pbakim_atanan_per;pbakim_aciklama", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {

            var fieldValues = values[0].slice(',');

            document.getElementById("<%= guncellepersonelisim.ClientID %>").value = fieldValues[0];
            document.getElementById("<%= guncelleperiyodikaciklama.ClientID %>").value = fieldValues[1];
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
                <li><a href="anasayfa.aspx"><i class='bx bxs-error icon'></i>Arıza</a></li>
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
                <li>
                    <a href="#" class="active"><i class='bx bxs-time-five icon'></i>Periyodik Bakımlar <i class='bx bx-chevron-right icon-right'></i></a>
                    <ul class="side-dropdown">
                        <li><a href="#" onclick="openPopup('popupOverlay8')">Varlık ekle</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- sidebar -->

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
                        <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="closePopup('popupOverlay2')">VAZGEÇ</a>
                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay3" onclick="closePopup('popupOverlay3')">
                <div class="popup-container" id="popupContainer3" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay3')">&times;</span>
                    <h2>İŞLEM SEÇ</h2>

                    <div class="eladio">
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay1')">YENİ</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay6')">GÜNCELLE</a>
                        <%--<a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay2')">GÜNCELLE</a>--%>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay2')">Sil</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay5')">Aktar</a>
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

                        <%--                        <asp:Button runat="server" ID="islem_ekle" OnClick="islem_ekle_Click" CssClass="stokeklebtn" Text="İŞLEM EKLE" Style="background-color: green;" />--%>

                        <%--<asp:Button runat="server" ID="Button2" OnClick="Stokcikar_Click" CssClass="stokeklebtn" Text="STOK ÇIKAR" style="background-color:red;"/>--%>
                        <%-- <asp:Button runat="server" ID="StokIade" OnClick="StokIade_Click" CssClass="stokeklebtn" Text="İADE"/>--%>
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

            <asp:SqlDataSource runat="server" ID="SqlDataSource3"></asp:SqlDataSource>

            <div class="popup-overlay" id="popupOverlay8" onclick="closePopup('popupOverlay8')">
                <div class="popup-container" id="popupContainer8" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay8')">&times;</span>
                    <h2>VARLIKLAR</h2>

                    <div class="eladio">
                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%" CssClass="anagrid">
                            <SettingsSearchPanel Visible="False" />
                            <Settings ShowColumnHeaders="false" />
                            <Styles>
                                <Header Wrap="True" BackColor="White" Font-Names="Arial Black" Font-Size="7pt"></Header>

                                <SelectedRow BackColor="#F87C1D" ForeColor="White">
                                </SelectedRow>
                            </Styles>
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
                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="2" Caption="ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="varlik_isim" VisibleIndex="3" Caption="Sayaç Türü" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>

                            <Styles AdaptiveDetailButtonWidth="14">
                                <Header Font-Names="Arial Black" Font-Size="7pt" Wrap="True" BackColor="White"></Header>
                                <SelectedRow BackColor="#F87C1D" ForeColor="White"></SelectedRow>
                            </Styles>
                            <Paddings Padding="0px" />
                            <Border BorderWidth="0px" />
                            <BorderBottom BorderWidth="1px" />
                        </dx:ASPxGridView>



                        <div style="width: 100%; display: grid; grid-template-columns: repeat(2, 1fr);">
                            <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="openPopup4('popupOverlay9')">EKLE</a>
                            <asp:Button runat="server" ID="varlik_sil" OnClick="varlik_sil_Click" CssClass="stokeklebtn" Text="SİL" Style="background-color: red; font-size: 15px;" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay9" onclick="closePopup('popupOverlay9')">
                <div class="popup-container" id="popupContainer9" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay9')">&times;</span>
                    <h2>VARLIK EKLE</h2>

                    <div class="eladio">

                        <asp:TextBox runat="server" ID="varlikentrytxtbox" placeholder="Varlık İsmi Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:Button runat="server" ID="varlik_ekle_btn" OnClick="varlik_ekle_btn_Click" CssClass="stokeklebtn" Text="EKLE" Style="background-color: green;" />

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

                        <h6>Planlama Tarihi</h6>
                        <asp:TextBox ID="guncelleplantarihi" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <h6>Başlangıç Tarihi</h6>
                        <asp:TextBox ID="guncellebaslatarih" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <h6>Bitiş Tarihi</h6>
                        <asp:TextBox ID="guncellebitistarih" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="guncellepersonelisim" placeholder="Personel Adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="guncelleperiyodikaciklama" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <h6>Varlık</h6>
                        <asp:DropDownList runat="server" ID="guncellevarlikselect" DataSourceID="SqlDataSource3" DataTextField="varlik_isim" DataValueField="varlik_isim" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <%--<h6>Periyod</h6>--%>
                        <asp:DropDownList runat="server" ID="guncelleperiyodselect" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Aylık" Value="Aylık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="3 Aylık" Value="3 Aylık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="6 Aylık" Value="6 Aylık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Yıllık" Value="Yıllık" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <%--<h6>Durum</h6>--%>
                        <asp:DropDownList runat="server" ID="guncelledurumselect" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Açık" Value="Açık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Kapalı" Value="Kapalı" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <%--<h6>İşlem Durum</h6>--%>
                        <asp:DropDownList runat="server" ID="guncelleislemdurumselect" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Tamamlandı" Value="Tamamlandı" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Tamamlanmadı" Value="Tamamlanmadı" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Beklemede" Value="Beklemede" style="font-size: 13px;"></asp:ListItem>
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
                    <h2>PERİYODİK BAKIM EKLE</h2>

                    <div class="eladio">

                        <div style="width: 80%; position: relative; margin: 10px auto; display: flex; border: 1px solid; border-radius: 5px; padding: 4px;">

                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" onchange="updateButtonText()" AllowMultiple="false" />

                            <button type="button" id="CustomButton" onclick="document.getElementById('FileUpload1').click()">Dosya Seç</button>

                            <asp:Label ID="FileLabel" runat="server" />
                        </div>

                        <h6 style="margin: auto 5px;">Planlama Tarihi</h6>
                        <asp:TextBox ID="periyodikplandate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <h6 style="margin: auto 5px;">Başlangıç Tarihi</h6>
                        <asp:TextBox ID="periyodikbaslatarih" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <h6 style="margin: auto 5px;">Bitiş Tarihi</h6>
                        <asp:TextBox ID="periyodikbitistarih" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>


                        <asp:TextBox runat="server" ID="periyodikpersonelentry" placeholder="Personel Adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="periyodikaciklamalentry" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="periyodikmakineentry" placeholder="Makine Kodu Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <%--<h6 style="margin:auto 5px;">Varlık</h6>--%>

                        <asp:DropDownList runat="server" ID="periyodikvarlikselect" DataSourceID="SqlDataSource3" DataTextField="varlik_isim" DataValueField="varlik_isim" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <%--<h6 style="margin:auto 5px;">Periyod</h6>--%>

                        <asp:DropDownList runat="server" ID="periyodikperiyodselect" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Aylık" Value="Aylık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="3 Aylık" Value="3 Aylık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="6 Aylık" Value="6 Aylık" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Yıllık" Value="Yıllık" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>


                        <%--<h6 style="margin:auto 5px;">Durum</h6>--%>
                        <asp:DropDownList runat="server" ID="periyodikdurumselect" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Açık" Value="Açık" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <%--<h6 style="margin:auto 5px;">İşlem Durum</h6>--%>

                        <asp:DropDownList runat="server" ID="periyodikislemdurumselect" placeholder="İşlem Durumu Seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Tamamlandı" Value="Tamamlandı" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Tamamlanmadı" Value="Tamamlanmadı" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Beklemede" Value="Beklemede" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>


                        <asp:Button runat="server" ID="periyodik_bakim_ekle" CssClass="stokeklebtn" OnClick="periyodik_bakim_ekle_Click" Text="EKLE" />
                        <asp:Label runat="server" ID="uyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>

            <%--ARIZA EKLEME İÇİN POPUP BİTİŞİ--%>
            <!--POPUP -->

            <!-- MAIN -->
            <main style="height: 100vh;">

                <asp:Label runat="server" ID="arizaturulabel" Visible="false"></asp:Label>
                <asp:Label runat="server" ID="dosyakayitdeneme"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="data" style="height: 100%;">
                    <div class="content-data" style="height: 100%; overflow-y: scroll;">
                        <div class="head">
                            <div class="denemecontainer">
                                <h3 style="color: #f87c1d;">PERİYODİK BAKIM</h3>
                                <div class="buttoncontainer">
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay1')">Yeni</a>
                                    <%--<a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay4')">İşlem</a>--%>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay2')">Sil</a>
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

                            <Styles>
                                <Header Wrap="True" BackColor="White" Font-Names="Arial Black" Font-Size="7pt"></Header>

                                <SelectedRow BackColor="#F87C1D" ForeColor="White">
                                </SelectedRow>
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
                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="1" Caption="ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_id" VisibleIndex="2" Caption="Periyodik ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_planli_tarih" VisibleIndex="0" Caption="Planlama Tarihi" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_atanan_per" VisibleIndex="3" Caption="Atann Personel" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_makkod" VisibleIndex="3" Caption="Makine" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_varlik" VisibleIndex="4" Caption="Varlık" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_periyod" VisibleIndex="7" Caption="Bakım periyodu">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_basla_tarih" VisibleIndex="8" Caption="Başlama Tarihi">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_bitis_tarih" VisibleIndex="18" Caption="Bitiş Tarihi">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_durum" VisibleIndex="10" Caption="Durum">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_islem_durum" VisibleIndex="11" Caption="İşlem Durumu">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="firma_id" VisibleIndex="12" Caption="Firma ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sil_durum" VisibleIndex="13" Caption="Silindi" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_dosya" VisibleIndex="14" Caption="Dosya" Visible="False">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="pbakim_aciklama" VisibleIndex="15" Caption="Açıklama">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Dosya" FieldName="pbakim_dosya" VisibleIndex="17">
                                    <HeaderStyle Cursor="pointer" ForeColor="#F87C1D" />
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>

                            <Styles AdaptiveDetailButtonWidth="14">
                                <Header Font-Names="Arial Black" Font-Size="7pt" Wrap="True" BackColor="White"></Header>
                                <SelectedRow BackColor="#F87C1D" ForeColor="White"></SelectedRow>
                            </Styles>
                            <Paddings Padding="0px" />
                            <Border BorderWidth="0px" />
                            <BorderBottom BorderWidth="1px" />
                        </dx:ASPxGridView>
                        <dx:ASPxGridViewExporter runat="server" GridViewID="ASPxGridView1" ID="gridExporter"></dx:ASPxGridViewExporter>
                    </div>
                </div>

            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="JS/JS1.js"></script>

        <asp:HiddenField runat="server" ID="selectedSonuc" />
        <asp:HiddenField runat="server" ID="selectedAriza" />
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>

        function updateButtonText() {
            var fileUpload = document.getElementById('FileUpload1');
            var customButton = document.getElementById('CustomButton');
            var fileLabel = document.getElementById('<%= FileLabel.ClientID %>'); 

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
-                customButton.innerText = 'Dosya Seç';
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

        function openPopup4(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);
            closePopup('popupOverlay8');
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

        function toggleList() {
            var liste = document.getElementById('profil-liste');
            liste.classList.toggle('goster');
        }
    </script>
</body>
</html>
