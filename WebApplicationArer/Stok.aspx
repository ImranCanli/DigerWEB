<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Stok.aspx.vb" Inherits="WebApplicationArer.Stok" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="CSS/STYLE1.css" rel="stylesheet" />
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

        .popup-trigger1 {
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
            width: 350px;
        }

            .popup-trigger1:hover {
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

        .trigger {
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

        @media only screen and (min-width: 768px) {
            .popup-container {
                width: 80%;
            }
        }

        @media only screen and (max-width: 760px) {
            .buttoncontainer {
                grid-template-columns: repeat(1, 1fr);
            }

            .popup-trigger {
                display: none;
            }

            .trigger {
                display: inline-block;
            }
        }

        @media only screen and (min-width: 1200px) {
            .popup-container {
                width: 80%;
            }
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
    <form runat="server" id="form1">
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">ARER BAKIM</a>
            <ul class="side-menu">
                <%--<li><a href="anasayfa.aspx"><i class='bx bxs-home icon'></i>ANA SAYFA</a></li>--%>
                <li><a href="anasayfa.aspx"><i class='bx bxs-error icon'></i>Arıza</a></li>
                <li class="divider" data-text="STOK">STOK</li>
                <li>
                    <a href="#" class="active"><i class='bx bxs-inbox icon'></i>STOK <i class='bx bx-chevron-right icon-right'></i></a>
                    <ul class="side-dropdown">
                        <li><a href="#">Stok Ana</a></li>
                        <li><a href="StokHareket.aspx">Stok Hareketleri</a></li>
                    </ul>
                </li>
                <li class="divider" data-text="SAYAÇLAR">SAYAÇLAR</li>
                <li><a href="Sayaclar.aspx"><i class='bx bxs-tachometer icon'></i>Sayaçlar</a></li>
                <li class="divider" data-text="PERİYODİK">PERİYODİK BAKIMLAR</li>
                <li><a href="periyodik.aspx"><i class='bx bxs-time-five icon'></i>Periyodik Bakımlar</a></li>
            </ul>
        </section>
        <!-- SIDEBAR -->

        <!-- NAVBAR -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu toggle-sidebar'></i>
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
                    <h2>STOK İŞLEM</h2>

                    <div class="eladio">
                        <asp:TextBox ID="harekettarih" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <!-- Diğer Stok ekleme için form veya içerik buraya eklenebilir -->
                        <asp:TextBox runat="server" ID="hareketadet" placeholder="İşlem adeti giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox Visible="false" runat="server" ID="hareketmakkod" placeholder="Makine Kodu Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="harekenyapan" placeholder="Personel Adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox Visible="false" runat="server" ID="hareketbakim" placeholder="Bakım id Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="iadevecikis" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="İADE" Value="İADE" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="GİRİŞ" Value="GİRİŞ" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="StokEkle" OnClick="StokEkle_Click" CssClass="stokeklebtn" Text="STOK EKLE" Style="background-color: green;" />
                        <%--                    <asp:Button runat="server" ID="Stokcikar" OnClick="Stokcikar_Click" CssClass="stokeklebtn" Text="STOK ÇIKAR" style="background-color:red;"/>
                    <asp:Button runat="server" ID="StokIade" OnClick="StokIade_Click" CssClass="stokeklebtn" Text="İADE"/>--%>
                        <asp:Label runat="server" ID="Label1" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceForBakim"></asp:SqlDataSource>

            <div class="popup-overlay" id="popupOverlay3" onclick="closePopup('popupOverlay3')">
                <div class="popup-container" id="popupContainer3" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay3')">&times;</span>
                    <h2>STOK İŞLEM</h2>

                    <div class="eladio">
                        <asp:TextBox ID="TextBox1" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <!-- Diğer Stok ekleme için form veya içerik buraya eklenebilir -->
                        <asp:TextBox runat="server" ID="TextBox2" placeholder="İşlem adeti giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox Visible="false" runat="server" ID="TextBox3" placeholder="Makine Kodu Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="TextBox4" placeholder="Personel Adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox Visible="false" runat="server" ID="TextBox5" placeholder="Bakım id Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <div style="width: 80%; margin: auto;">

                            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceForBakim" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%">
                                <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
                                <Styles>
                                    <Header Wrap="True" BackColor="White" Font-Names="Arial Black" Font-Size="7pt"></Header>
                                    <SelectedRow BackColor="#F87C1D" ForeColor="White">
                                    </SelectedRow>
                                </Styles>
                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                                    AllowHideDataCellsByColumnMinWidth="true">
                                </SettingsAdaptivity>
                                <SettingsPager PageSize="45" />
                                <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="480" />
                                <SettingsBehavior ProcessFocusedRowChangedOnServer="true" AllowEllipsisInText="true" AllowFocusedRow="True" AllowSelectByRowClick="True" />

                                <SettingsPopup>
                                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                                </SettingsPopup>
                                <SettingsSearchPanel Visible="False" />

                                <Columns>
                                    <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="tarih" VisibleIndex="1" Caption="Tarih">
                                        <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ariza_id" VisibleIndex="12" Caption="Arıza ID" Visible="false">
                                        <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <%--                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="12" Caption="ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>--%>
                                    <dx:GridViewDataTextColumn FieldName="makkod" VisibleIndex="3" Caption="Makine Kod">
                                        <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ariza_turu" VisibleIndex="4" Caption="Tür">
                                        <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="islem_acan" VisibleIndex="5" Caption="İşlem Açan">
                                        <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="baslik" VisibleIndex="2" Caption="Başlık">
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

                        </div>

                        <%--<button onclick="addStock()">Stok Ekle</button>--%>

                        <%--<asp:Button runat="server" ID="Button2" OnClick="StokEkle_Click" CssClass="stokeklebtn" Text="STOK EKLE" style="background-color:green;"/>--%>
                        <asp:Button runat="server" ID="Stokcikar" OnClick="Stokcikar_Click" CssClass="stokeklebtn" Text="STOK ÇIKAR" Style="background-color: red;" />
                        <%--       <asp:Button runat="server" ID="StokIade" OnClick="StokIade_Click" CssClass="stokeklebtn" Text="İADE"/>--%>
                        <asp:Label runat="server" ID="Label2" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>


            <div class="popup-overlay" id="popupOverlay4" onclick="closePopup('popupOverlay4')">
                <div class="popup-container" id="popupContainer4" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay4')">&times;</span>
                    <h2>STOK İŞLEM</h2>

                    <div class="eladio">
                        <asp:TextBox ID="TextBox6" runat="server" type="date" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <!-- Diğer Stok ekleme için form veya içerik buraya eklenebilir -->
                        <asp:TextBox runat="server" ID="TextBox7" placeholder="İşlem adeti giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="TextBox8" placeholder="Makine Kodu Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="TextBox9" placeholder="Personel Adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="TextBox10" placeholder="Bakım id Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>


                        <%--<button onclick="addStock()">Stok Ekle</button>--%>

                        <%--<asp:Button runat="server" ID="Button2" OnClick="StokEkle_Click" CssClass="stokeklebtn" Text="STOK EKLE" style="background-color:green;"/>--%>
                        <%--<asp:Button runat="server" ID="Button2" OnClick="Stokcikar_Click" CssClass="stokeklebtn" Text="STOK ÇIKAR" style="background-color:red;"/>--%>
                        <asp:Button runat="server" ID="StokIade" OnClick="StokIade_Click" CssClass="stokeklebtn" Text="İADE" />
                        <asp:Label runat="server" ID="Label3" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>

            <div class="popup-overlay" id="popupOverlay5" onclick="closePopup('popupOverlay5')">
                <div class="popup-container" id="popupContainer5" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay5')">&times;</span>
                    <h2>İŞLEMLER</h2>

                    <div class="eladio">
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 40px; margin: 10px auto;" onclick="openPopup2('popupOverlay1')">Kart Ekle</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 40px; margin: 10px auto; text-align: center;" onclick="openPopup2('popupOverlay2')">Giriş</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 40px; margin: 10px auto; text-align: center;" onclick="openPopup2('popupOverlay3')">Çıkış</a>
                        <a href="#" class="popup-trigger1" style="z-index: 2; height: 40px; margin: 10px auto; text-align: center;" onclick="openPopup2('popupOverlay4')">İade</a>
                        <a href="stok_hareket2.aspx" class="popup-trigger1" style="z-index: 2; height: 40px; margin: 10px auto;">Hareketler</a>
                    </div>

                </div>
            </div>


            <div class="popup-overlay" id="popupOverlay1" onclick="closePopup('popupOverlay1')">
                <div class="popup-container" id="popupContainer1" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay1')">&times;</span>
                    <h2>Stok Ekle</h2>

                    <div class="eladio">
                        <asp:TextBox ID="txtStockDate" type="date" runat="server" CssClass="datepicker" placeholder="Tarih seçiniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <!-- Diğer Stok ekleme için form veya içerik buraya eklenebilir -->
                        <asp:TextBox runat="server" ID="stokkodentry" placeholder="Stok Kodu giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="stokadentry" placeholder="Stok Adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="menseientry" placeholder="Menşei Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="ekleyenentry" placeholder="Ekleyen Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="turentry" placeholder="Tür Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="isletmeturuentry" placeholder="İşletme Türü Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="barkodnoentry" placeholder="Barkod No Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox Visible="false" runat="server" ID="birimentry" placeholder="Birim Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:DropDownList runat="server" ID="BirimTurEntry" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;">
                            <asp:ListItem Text="Adet" Value="Adet" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Litre" Value="Lt" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Kilogram" Value="Kg" style="font-size: 13px;"></asp:ListItem>
                            <asp:ListItem Text="Metre" Value="Metre" style="font-size: 13px;"></asp:ListItem>
                        </asp:DropDownList>

                        <%--<button onclick="addStock()">Stok Ekle</button>--%>
                        <asp:Button runat="server" ID="Button1" CssClass="stokeklebtn" OnClick="Button1_Click" Text="KART EKLE" />
                        <asp:Label runat="server" ID="uyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>
            <!--POPUP -->

            <!-- MAIN -->
            <main>

                <%--			<div class="info-data">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <div class="data">
                    <div class="content-data">
                        <div class="head">
                            <div class="denemecontainer">
                                <h3 style="color: #f87c1d;">STOK</h3>
                                <div class="buttoncontainer">
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px;" onclick="openPopup('popupOverlay1')">Kart Ekle</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay2')">Giriş</a>
                                    <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay3')">Çıkış</a>
                                    <%--<a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay4')">İade</a>--%>
                                    <a href="stok_hareket2.aspx" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px;">Hareketler</a>
                                    <a href="#" class="trigger" style="z-index: 2; height: 30px; margin: 5px;" onclick="openPopup('popupOverlay5')">İşlem</a>
                                    <%--<asp:Button runat="server" ID="stoksil" CssClass="stoksilbtn" OnClick="stoksil_Click" BackColor="Red" Text="İşlem" z-index="-1"/>--%>
                                </div>
                            </div>
                        </div>
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%">
                            <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
                            <SettingsSearchPanel Visible="True" />

                            <Styles>
                                <Header Wrap="True" BackColor="White" Font-Names="Arial Black" Font-Size="7pt"></Header>

                                <SelectedRow BackColor="#F87C1D" ForeColor="White">
                                </SelectedRow>
                            </Styles>
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                                AllowHideDataCellsByColumnMinWidth="true">
                            </SettingsAdaptivity>
                            <SettingsPager PageSize="32" />
                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="480" />
                            <SettingsBehavior AllowEllipsisInText="true" AllowFocusedRow="True" AllowSelectByRowClick="True" ProcessFocusedRowChangedOnServer="True" />
                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <SettingsSearchPanel Visible="False" />

                            <Columns>
                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="2" Caption="ID" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="stok_kodu" VisibleIndex="1" Caption="Stok Kodu" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="tarih" VisibleIndex="3" Caption="Tarih" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="stok_adi" VisibleIndex="5" Caption="Stok Adı" MinWidth="60">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="birim" VisibleIndex="9" Caption="Birim">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="fiili_adet" VisibleIndex="10" Caption="Fiili Adet" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="tur" VisibleIndex="11" Caption="Tür">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="isletme_tur" VisibleIndex="12" Caption="İşletme Türü">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="barkod_no" VisibleIndex="13" Caption="Barkod No">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="mensei" VisibleIndex="14" Caption="Menşei">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="giren" VisibleIndex="15" Caption="Giren">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="cikan" VisibleIndex="16" Caption="Çıkan">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="guncel_adet" VisibleIndex="17" Caption="Kalan Adet">
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
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%--    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>--%>
        <script src="JS/MAIN.js"></script>

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
    </form>
    <script>

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

            closePopup('popupOverlay5')
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
