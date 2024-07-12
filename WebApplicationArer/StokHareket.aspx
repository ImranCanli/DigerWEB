<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StokHareket.aspx.vb" Inherits="WebApplicationArer.StokHareket" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="CSS/STYLE1.css" rel="stylesheet" />
    <title>STOK HAREKET</title>
<style>
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
                <%--<li><a href="anasayfa.aspx"><i class='bx bxs-home icon' ></i> ANA SAYFA</a></li>--%>
                <li><a href="anasayfa.aspx"><i class='bx bxs-error icon'></i>Arıza</a></li>
                <li class="divider" data-text="STOK">STOK</li>
                <li>
                    <a href="#" class="active"><i class='bx bxs-inbox icon'></i>STOK <i class='bx bx-chevron-right icon-right'></i></a>
                    <ul class="side-dropdown">
                        <li><a href="Stok.aspx">Stok Ana</a></li>
                        <li><a href="#">Stok Hareketleri</a></li>
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

            <!-- MAIN -->
            <main>

                <%--			<div class="info-data">
				<div class="card">
					<div class="head">
						<div>
							<h2><asp:Label runat="server" ID="girenstoklabel">23</asp:Label></h2>
							<p>GİREN</p>
						</div>
						<i class='bx bx-trending-up icon' ></i>
					</div>
				</div>
				<div class="card">
					<div class="head">
						<div>
							<h2><asp:Label runat="server" ID="cikanstoklabel">45</asp:Label></h2>
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
                            <h3 style="color: #F87C1D;">STOK HAREKETLERİ</h3>
                        </div>
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="id" ClientInstanceName="ASPxGridView1" Width="100%">
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
                                <dx:GridViewDataTextColumn FieldName="tarih" VisibleIndex="2" Caption="Tarih">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="stok_id" VisibleIndex="12" Caption="Stok ID" Visible="false">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="stok_adi" VisibleIndex="1" Caption="Stok Adı">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="tur" VisibleIndex="3" Caption="Tür">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="adet" VisibleIndex="5" Caption="İşlem Adedi">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="hareket_turu" VisibleIndex="9" Caption="Hareket">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="isletme_tur" VisibleIndex="10" Caption="İşletme Türü">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="islem_yapan" VisibleIndex="11" Caption="İşlem yapan">
                                    <HeaderStyle Cursor="pointer" Font-Bold="True" ForeColor="#F87C1D" HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>

                            <FormatConditions>
                                <dx:GridViewFormatConditionIconSet Format="PositiveNegativeArrowsColored" ShowInColumn="hareket_turu" />
                            </FormatConditions>

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

        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="JS/MAIN.js"></script>
    </form>
    <script>
        function toggleList() {
            var liste = document.getElementById('profil-liste');
            liste.classList.toggle('goster');
        }
    </script>
</body>
</html>
