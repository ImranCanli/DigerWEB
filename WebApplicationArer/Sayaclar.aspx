<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Sayaclar.aspx.vb" Inherits="WebApplicationArer.Sayaclar" %>

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

            .denemecontainer {
                grid-template-columns: repeat(2, 1fr);
            }
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

        #Label1 {
            margin-top: 10px;
        }

        .anacard {
            overflow-y: scroll;
            height: 300px;
            width: 300px;
            min-height: 300px;
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
</head>
<body>
    <script type="text/javascript">

        function OnRowSelectionChanged(s, e) {
            s.GetSelectedFieldValues("aciklama;atanan_per", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {

            var fieldValues = values[0].slice(',');

            document.getElementById("<%= guncelsayacaciklamaentry.ClientID %>").value = fieldValues[0];
            document.getElementById("<%= guncelsayacpersonelentry.ClientID %>").value = fieldValues[1];

        }
    </script>

    <form id="form1" runat="server">
        <section id="sidebar">
            <a href="#" class="brand">ARER BAKIM</a>
            <ul class="side-menu">
                <li><a href="anasayfa.aspx"><i class='bx bxs-message icon'></i>ARIZALAR</a></li>
                <li class="divider" data-text="STOK">STOK</li>
                <li>
                    <a href="#"><i class='bx bxs-inbox icon'></i>STOK <i class='bx bx-chevron-right icon-right'></i></a>
                    <ul class="side-dropdown">
                        <li><a href="Stok.aspx">Stok Ana</a></li>
                        <li><a href="StokHareket.aspx">Stok Hareketleri</a></li>
                    </ul>
                </li>
                <li class="divider" data-text="SAYAÇLAR">SAYAÇLAR</li>
                <li>
                    <a href="#" class="active"><i class='bx bxs-inbox icon'></i>Sayaçlar <i class='bx bx-chevron-right icon-right'></i></a>
                    <ul class="side-dropdown">
                        <li><a href="#" onclick="openPopup('popupOverlay5')">Sayaç türü ekle</a></li>
                        <li><a href="#" onclick="openPopup('popupOverlay8')">Varlık ekle</a></li>
                    </ul>
                </li>
                <li class="divider" data-text="PERİYODİK">PERİYODİK BAKIMLAR</li>
                <li><a href="periyodik.aspx"><i class='bx bxs-time-five icon'></i>Periyodik Bakımlar</a></li>
            </ul>
        </section>

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
                    <h2>GÜNCELLE</h2>
                    <div class="eladio">

                        <%--<h6>TARİH</h6>--%>
                        <%--<asp:TextBox ID="sayacguncelledate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>--%>

                        <asp:TextBox runat="server" ID="guncelsayacaciklamaentry" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="guncelsayacpersonelentry" placeholder="Personel Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="guncelsayacturselect" DataSourceID="SqlDataSource2" DataTextField="tur_isim" DataValueField="tur_isim" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="guncelvarlikselect" DataSourceID="SqlDataSource3" DataTextField="varlik_isim" DataValueField="varlik_isim" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="guncelbirimselect" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="metreküp" Value="metreküp" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Litre" Value="Litre" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Kilogram" Value="Kilogram" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button runat="server" ID="sayacguncellebuton" CssClass="stokeklebtn" Text="GÜNCELLE" OnClick="sayacguncellebuton_Click" />
                        <asp:Label runat="server" ID="Label2" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
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
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay2')">GÜNCELLE</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 50px; margin: 10px 5px; text-align: center;" onclick="openPopup2('popupOverlay6')">Sil</a>
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

            <div class="popup-overlay" id="popupOverlay5" onclick="closePopup('popupOverlay5')">
                <div class="popup-container" id="popupContainer5" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay5')">&times;</span>
                    <h2>SAYAÇ TÜR</h2>

                    <div class="eladio">

                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%" CssClass="anagrid">
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
                                <dx:GridViewDataTextColumn FieldName="tur_isim" VisibleIndex="3" Caption="Sayaç Türü" MinWidth="60">
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
                            <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="openPopup3('popupOverlay7')">EKLE</a>
                            <asp:Button runat="server" ID="sayac_tur_sil" OnClick="sayac_tur_sil_Click" CssClass="stokeklebtn" Text="SİL" Style="background-color: red; font-size: 15px;" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay7" onclick="closePopup('popupOverlay7')">
                <div class="popup-container" id="popupContainer7" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay7')">&times;</span>
                    <h2>SAYAÇ TÜRÜ EKLE</h2>

                    <div class="eladio">
                        <asp:TextBox runat="server" ID="Sayacisimentry" placeholder="Tür İsmi Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:Button runat="server" ID="sayac_tur_ekle" OnClick="sayac_tur_ekle_Click" CssClass="stokeklebtn" Text="EKLE" Style="background-color: green;" />

                    </div>
                </div>
            </div>


            <div class="popup-overlay" id="popupOverlay6" onclick="closePopup('popupOverlay6')">
                <div class="popup-container" id="popupContainer6" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay6')">&times;</span>
                    <h2>SAYAC SİL</h2>

                    <%--<h6>Bu ticket'ı silmek istediğinizden emin misiniz ?</h6>--%>
                    <div class="silcontainer">
                        <asp:Button runat="server" ID="sayac_sil" CssClass="stokeklebtn" Text="SİL" Style="background-color: red; margin: 5px auto; width: 80%;" OnClick="sayac_sil_Click" />
                        <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="closePopup('popupOverlay6')">VAZGEÇ</a>
                        <asp:Label runat="server" ID="sayacsiluyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>

                    </div>
                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay4" onclick="closePopup('popupOverlay4')">
                <div class="popup-container" id="popupContainer4" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay4')">&times;</span>
                    <h2>SAYAÇ OKUMA</h2>

                    <div class="eladio">

                        <h6>OKUMA TARİHİ</h6>
                        <asp:TextBox ID="sayacokudate" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="sayac_oku_birim_entry" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="metreküp" Value="metreküp" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Litre" Value="Litre" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Kilogram" Value="Kilogram" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <!-- işlem parametreleri -->
                        <asp:TextBox runat="server" ID="sayac_oku_deger_entry" placeholder="Değer giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:Button runat="server" ID="sayac_oku_ekle" OnClick="sayac_oku_ekle_Click" CssClass="stokeklebtn" Text="İŞLEM EKLE" Style="background-color: green;" />
                        <asp:Label runat="server" ID="Label3" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>

            <!--YENİ SAYAÇ EKLEME POPUP -->
            <div class="popup-overlay" id="popupOverlay1" onclick="closePopup('popupOverlay1')">
                <div class="popup-container" id="popupContainer1" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay1')">&times;</span>
                    <h2>YENİ SAYAÇ</h2>

                    <div class="eladio">

                        <asp:TextBox runat="server" ID="sayacaciklamaentry" TextMode="MultiLine" placeholder="Açıklama Giriniz" Style="width: 80%; height: 150px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="sayacpersonentry" placeholder="Personel Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="sayacturentry" DataSourceID="SqlDataSource2" DataTextField="tur_isim" DataValueField="tur_isim" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="varlikentry" DataSourceID="SqlDataSource3" DataTextField="varlik_isim" DataValueField="varlik_isim" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="birimentry" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="metreküp" Value="metreküp" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Litre" Value="Litre" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Kilogram" Value="Kilogram" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="sayac_ekle" CssClass="stokeklebtn" Text="SAYAÇ EKLE" OnClick="sayac_ekle_Click" />
                        <asp:Label runat="server" ID="uyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>
            <!--YENİ SAYAÇ EKLEME POPUP -->

            <!-- MAIN -->
            <main style="height: 100vh">

                <asp:Label runat="server" ID="dosyakayitdeneme"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="data" style="height: 100%;">
                    <div class="content-data" style="height: 100%; overflow-y: scroll">
                        <div class="head">
                            <div class="denemecontainer">
                                <h3 style="color: #f87c1d;">SAYAÇLAR</h3>
                                <div class="buttoncontainer">
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay1')">YENİ</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay6')">SİL</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay4')">İŞLEM</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay2')">GÜNCELLE</a>
                                    <a href="#" class="popup-trigger1" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay3')">SEÇ</a>
                                </div>
                            </div>
                        </div>

                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%" CssClass="anagrid">
                            <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>

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
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="2" Caption="ID" MinWidth="60" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sayac_tur" VisibleIndex="1" Caption="Sayaç Türü" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="en_son_okunan_deger" VisibleIndex="6" Caption="Son okunan değer" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="son_okuma_tarihi" VisibleIndex="7" Caption="Son okuma tarihi" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="onceki_deger" VisibleIndex="8" Caption="Önceki değer" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="onceki_tarih" VisibleIndex="9" Caption=" Önceki tarih">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="fark" VisibleIndex="10" Caption="Fark">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sayac_id" VisibleIndex="9" Caption="Sayaç ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="aciklama" VisibleIndex="3" Caption="Açıklama">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="atanan_per" VisibleIndex="2" Caption="Atanan Personel">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="varlik" VisibleIndex="4" Caption="Varlık">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="birim" VisibleIndex="5" Caption="Birim">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="firma_id" VisibleIndex="14" Caption="Firma ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="sil_durum" VisibleIndex="15" Caption="Silindi" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
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
                    </div>
                </div>

            </main>
            <%--<asp:Image runat="server" ID="resim"/>--%>
            <!-- MAIN -->
        </section>


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
            // Parantez içerisindeki boş kısma gelmesi gereken şey ; "FileLabel.ClientID" yani var fileLabel = document.getElementById(' Buraya gelecek ! ');

            if (fileUpload.files.length > 0) {
                customButton.innerText = 'Dosya Seçildi';
                fileLabel.innerText = 'Seçilen Dosya: ' + fileUpload.files[0].name;
            } else {
                customButton.innerText = 'Dosya Seç';
                fileLabel.innerText = '';
            }
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

        function openPopup3(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);
            closePopup('popupOverlay5');
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

        function openPopup(popupId) {
            var popupOverlay = document.getElementById(popupId);
            var popupContainer = popupOverlay.querySelector('.popup-container');

            popupOverlay.style.display = 'block';

            setTimeout(function () {
                popupOverlay.style.opacity = 1;
                popupContainer.style.opacity = 1;
            }, 10);

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
