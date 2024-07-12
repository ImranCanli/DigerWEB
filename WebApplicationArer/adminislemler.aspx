<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminislemler.aspx.vb" Inherits="WebApplicationArer.adminislemler" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/STYLE1.css" rel="stylesheet" />
    <link href="CSS/checkboxcss.css" rel="stylesheet" />
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
               /* display: none;*/
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
            display: flex;
            justify-content: center;
            align-items: center;
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

        .kullanicidiv{
            display: flex;
            width: 100%;
            justify-content: space-between;
        }

        .kaydetmebutonu{
            border:none; 
            outline:none;
            background-color: green; 
            border-radius: 5px; 
            width: 80px; height: 30px; 
            color: white; 
            font-size: small;
        }
        .kaydetmebutonu:hover{
            background-color: darkgreen;
        }

        .varmıyokmu{
            display: none;
        }

        .duzenlemebutonu{
            padding: 7px;
            border:none; 
            outline:none;
            background-color: #f87c1d; 
            border-radius: 5px; 
            width: 80px; height: 30px; 
            color: white; 
            font-size: small;
            cursor: pointer;
            /*display: flex;*/
            justify-content: center;
            align-items: center;
            text-align: center;
            padding-top: 5px;
        }
        .duzenlemebutonu:hover{
            background-color: #d66900;
        }


    </style>

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

                <%--<div style="position:absolute; right:5%; top:20%; border-radius:50%; overflow:hidden; width:40px; height:40px; display:flex; border: 1px solid grey">
                    <img src="images/profile.png" />
                </div>--%>
                <div class="profil" onclick="toggleList()">
                    <img src="Images/profile.png" alt="Profil İkonu" />
                    <ul id="profil-liste" class="profil-liste">
                        <li><asp:LinkButton runat="server" ID="ayarlarbuton" OnClick="ayarlarbuton_Click" Text="Ayarlar" ForeColor="#f87c1d"></asp:LinkButton></li>
                        <li><asp:LinkButton runat="server" ID="cikisyap" OnClick="cikisyap_Click" Text="Çıkış" ForeColor="#f87c1d"></asp:LinkButton></li>
                    </ul>
                </div>

            </nav>
            <!-- NAVBAR -->

            <div class="popup-overlay" id="popupOverlay2" onclick="closePopup('popupOverlay2')">
                <div class="popup-container" id="popupContainer2" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay2')">&times;</span>
                    <h2>KULLANICI SİL</h2>
                    <div class="silcontainer">
                        <asp:Button runat="server" ID="silbuton" CssClass="stokeklebtn" OnClick="silbuton_Click" Text="SİL" Style="background-color: red; margin: 5px auto; width: 80%;" />
                        <a href="#" class="popup-trigger_new" style="z-index: 2; height: 40px; margin: 13px auto; text-align: center; width: 80%; padding-top: 10px; padding: 5px 20px;" onclick="closePopup('popupOverlay2')">VAZGEÇ</a>
                    </div>
                </div>
            </div>


            <div class="popup-overlay" id="popupOverlay1" onclick="closePopup('popupOverlay1')">
                <div class="popup-container" id="popupContainer1" onclick="event.stopPropagation();" style="width: 120%;">
                    <span class="close-btn" onclick="closePopup('popupOverlay1')">&times;</span>
                    <h2>KULLANICI EKLE</h2>

                    <div class="eladio">

                        <asp:TextBox runat="server" ID="kullaniciismientry" placeholder="Kullanıcının ismini Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:TextBox runat="server" ID="kullaniciadientry" placeholder="Kullanıcı adı Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>
                        <asp:TextBox runat="server" ID="kullanicisifreentry" placeholder="Kullanıcı şifresi Giriniz" Style="width: 80%; height: 50px; border-radius: 5px; margin: 10px auto; border: 0.5px solid; padding-left: 7px;"></asp:TextBox>

                        <asp:Button runat="server" ID="kulaniciekleBtn" OnClick="kulaniciekleBtn_Click" CssClass="stokeklebtn" Text="KULLANICI EKLE" />
                        <asp:Label runat="server" ID="uyarilabel" Text="Lütfen girilen verilerin tutarlılığından emin olunuz" Style="width: 80%; height: 35px; margin: 10px auto; font-size: 12px; color: red;" Visible="false"></asp:Label>
                    </div>

                </div>
            </div>

            <main style="height: 100vh;">

                <a href="#" class="popup-trigger" style="z-index: 2; height: 30px; margin: 5px; text-align: center;" onclick="openPopup('popupOverlay1')">EKLE</a>
                

                <asp:Repeater runat="server" ID="Repeater1">
                    <ItemTemplate>
              <div class="info-data">
				<div class="card">
					<div class="head">
						<div style="width:100%;">
							<h2><asp:Label runat="server" ID="girenstoklabel"></asp:Label></h2>
                            <div style="display: flex; width: 100%; justify-content: space-between;">
							<p><label style="font-size: medium;"><%# Eval("ad")%></label></p>
                            <div style="display:none;"><%# Eval("id")%></div>
                            <%--<button class="duzenlemebutonu" onclick="duzenlemeyiaktiflestir()">Düzenle</button>--%>

                            <%--<button id="butonkaydet" class="kaydetmebutonu varmıyokmu">Kaydet</button>--%>
                            <div>
                            <a class="duzenlemebutonu" id='<%# "duzenlebuton_" + Container.ItemIndex.ToString() %>' onclick="duzenlemeyiaktiflestir('<%# "duzenlebuton_" + Container.ItemIndex.ToString() %>', '<%# Eval("id") %>', '<%# "Repeater1_butonkaydet_" + Container.ItemIndex.ToString()%>', '<%# "silmebutonu_" + Container.ItemIndex.ToString()%>')">Düzenle</a>
                            <asp:Button runat="server" ID="butonkaydet" CssClass="kaydetmebutonu varmıyokmu" Text="Kaydet" OnClick="butonkaydet_Click"/>
                            <a href="#" id='<%# "silmebutonu_" + Container.ItemIndex.ToString()%>' class="popup-trigger1 varmıyokmu" style="z-index: 2; height: 30px; margin: 5px; text-align: center; background-color: red;" onclick="openPopup('popupOverlay2')">SİL</a>
                            </div>
                            </div>
                            <div style="width: 98%; height: 1px; background-color: darkgray; margin-bottom: 15px; opacity: .4;"></div>
                            <div style="display:grid; width:100%;">

                                <div style="width:100%; font-size: small; display:grid; justify-content:space-around; grid-template-columns: 100%; grid-row-gap:13px;">
                                    <div class="kullanicidiv">
                                    <label>Admin Yetkisi</label>
                                        <div class="varmıyokmu"><%# Eval("yetki")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Arıza ekleme</label>
                                        <div class="varmıyokmu"><%# Eval("ariza_ekle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Arıza silme</label>
                                        <div class="varmıyokmu"><%# Eval("ariza_sil")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Arıza güncelleme</label>
                                        <div class="varmıyokmu"><%# Eval("ariza_guncelle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Arıza sonuçlandırma</label>
                                        <div class="varmıyokmu"><%# Eval("ariza_sonuclandir")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Stok kart ekleme</label>
                                        <div class="varmıyokmu"><%#Eval("stok_kart_ekle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Stok girişi yapma</label>
                                        <div class="varmıyokmu"><%# Eval("stok_giris_yap")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Stok çıkışı yapma</label>
                                        <div class="varmıyokmu"><%# Eval("stok_cikis_yap")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Sayaç ekleme</label>
                                        <div class="varmıyokmu"><%# Eval("sayac_ekle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Sayaç silme</label>
                                        <div class="varmıyokmu"><%# Eval("sayac_sil")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Sayaç işlem girme</label>
                                        <div class="varmıyokmu"><%# Eval("sayac_islem_gir")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Sayaç güncelleme</label>
                                        <div class="varmıyokmu"><%# Eval("sayac_guncelle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Periyodik bakım ekleme</label>
                                        <div class="varmıyokmu"><%# Eval("pbakim_ekle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Periyodik bakım silme</label>
                                        <div class="varmıyokmu"><%# Eval("pbakim_sil")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                    <div class="kullanicidiv">
                                    <label>Periyodik bakım güncelleme</label>
                                        <div class="varmıyokmu"><%# Eval("pbakim_guncelle")%></div>
                                    <div class="toggle-btn">
                                    <div class="icon1">
                                        <i class='bx bxs-lock-open'></i>
                                    </div>
                                </div>
                               </div>
                                </div>
                            </div>
						</div>		
					</div>
				</div>
			</div>

                    <asp:HiddenField runat="server" ID="Duzenleniyormu" ClientIDMode="AutoID" Value="0" />

                    </ItemTemplate>
                </asp:Repeater>

                <asp:HiddenField runat="server" ID="duzenlenenitemId" Value="0"/>

                <asp:HiddenField runat="server" ID="adminyetkisivarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="arizaeklemevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="arizasilmevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="arizaguncellemevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="ariasonuclandirmavarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="stokkartieklemevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="stokgirisiyapmavarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="stokcikisiyapmavarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="sayaceklemevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="sayacsilmevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="sayacislemgirmevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="sayacguncellemevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="periyodikbakimeklemevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="periyodikbakimsilmevarmi" Value="0"/>
                <asp:HiddenField runat="server" ID="periyodikbakimguncellemevarmi" Value="0"/>

                <asp:Label runat="server" ID="dosyakayitdeneme"></asp:Label>

            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="JS/JS1.js"></script>

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

        //CHECKBOX BUTONLARI İÇİN ESKİ YÖNTEM BAŞLANGICI !!!

        //const toggleBtn = document.querySelector(".toggle-btn"),
        //    LockIcon = document.querySelector(".icon1 i");

        //toggleBtn.addEventListener("click", () => {
        //    toggleBtn.classList.toggle("active");
        //})

        //CHECKBOX BUTONLARI İÇİN ESKİ YÖNTEM SONU !!!

        function duzenlemeyiaktiflestir(duzenlemeID, gelenkayıtIdsi, gosterilecekbuton, silbutonshow) {

            var tumsilmebutonlari = document.getElementsByClassName('popup-trigger1');
            var tumduzenlemebutonlari = document.getElementsByClassName('duzenlemebutonu');
            var tumkaydetmebbutonlari = document.getElementsByClassName('kaydetmebutonu');

            for (var m = 0; m < tumduzenlemebutonlari.length; m++) {
                tumsilmebutonlari[m].classList.add('varmıyokmu');
                tumduzenlemebutonlari[m].classList.remove('varmıyokmu');
                tumkaydetmebbutonlari[m].classList.add('varmıyokmu');
            }

            var kaydetmebutonu = document.getElementById(gosterilecekbuton);
            var duzenlemebutonu = document.getElementById(duzenlemeID);
            var silmebutonu = document.getElementById(silbutonshow);
            kaydetmebutonu.classList.remove('varmıyokmu');
            silmebutonu.classList.remove('varmıyokmu');
            duzenlemebutonu.classList.add('varmıyokmu');
            document.getElementById('duzenlenenitemId').value = gelenkayıtIdsi;

            var parentdiv = duzenlemebutonu.closest(".head");

            var tumkullanicidivleri = parentdiv.getElementsByClassName('kullanicidiv');

            for (var j = 0; j < tumkullanicidivleri.length; j++) {
                var varmiyokmudivi = tumkullanicidivleri[j].getElementsByClassName('varmıyokmu')[0];
                var togglebtnbox = tumkullanicidivleri[j].getElementsByClassName('toggle-btn')[0];

                var ilkDeger = varmiyokmudivi.innerHTML.trim();

                switch (j) {
                    case 0:
                        document.getElementById('adminyetkisivarmi').value = ilkDeger;
                        break;
                    case 1:
                        document.getElementById('arizaeklemevarmi').value = ilkDeger;
                        break;
                    case 2:
                        document.getElementById('arizasilmevarmi').value = ilkDeger;
                        break;
                    case 3:
                        document.getElementById('arizaguncellemevarmi').value = ilkDeger;
                        break;
                    case 4:
                        document.getElementById('ariasonuclandirmavarmi').value = ilkDeger;
                        break;
                    case 5:
                        document.getElementById('stokkartieklemevarmi').value = ilkDeger;
                        break;
                    case 6:
                        document.getElementById('stokgirisiyapmavarmi').value = ilkDeger;
                        break;
                    case 7:
                        document.getElementById('stokcikisiyapmavarmi').value = ilkDeger;
                        break;
                    case 8:
                        document.getElementById('sayaceklemevarmi').value = ilkDeger;
                        break;
                    case 9:
                        document.getElementById('sayacsilmevarmi').value = ilkDeger;
                        break;
                    case 10:
                        document.getElementById('sayacislemgirmevarmi').value = ilkDeger;
                        break;
                    case 11:
                        document.getElementById('sayacguncellemevarmi').value = ilkDeger;
                        break;
                    case 12:
                        document.getElementById('periyodikbakimeklemevarmi').value = ilkDeger;
                        break;
                    case 13:
                        document.getElementById('periyodikbakimsilmevarmi').value = ilkDeger;
                        break;
                    case 14:
                        document.getElementById('periyodikbakimguncellemevarmi').value = ilkDeger;
                        break;
                }

                if (ilkDeger === "1") {
                    togglebtnbox.classList.add('active');
                }

                //if (varmiyokmudivi.innerHTML.trim() === "1") {
                //    togglebtnbox.classList.add('active');
                //}

                togglebtnbox.addEventListener('click', function () {

                    this.classList.toggle('active');

                    let index = Array.from(tumkullanicidivleri).indexOf(this.parentElement);

                    switch (index) {
                        case 0:
                            var adminyetkisitut = document.getElementById('adminyetkisivarmi');
                            if (this.classList.contains('active')) {
                                adminyetkisitut.value = "1";
                            }
                            else {
                                adminyetkisitut.value = "0";
                            }
                            break;
                        case 1:
                            var arizaeklemeyetkisitut = document.getElementById('arizaeklemevarmi');
                            if (this.classList.contains('active')) {
                                arizaeklemeyetkisitut.value = "1";
                            }
                            else {
                                arizaeklemeyetkisitut.value = "0";
                            }
                            break;
                        case 2:
                            var arizasilmeyetkisitut = document.getElementById('arizasilmevarmi');
                            if (this.classList.contains('active')) {
                                arizasilmeyetkisitut.value = "1";
                            }
                            else {
                                arizasilmeyetkisitut.value = "0";
                            }
                            break;
                        case 3:
                            var arizaguncelleme = document.getElementById('arizaguncellemevarmi');
                            if (this.classList.contains('active')) {
                                arizaguncelleme.value = "1";
                            }
                            else {
                                arizaguncelleme.value = "0";
                            }
                            break;
                        case 4:
                            var arizasonuclandirma = document.getElementById('ariasonuclandirmavarmi');
                            if (this.classList.contains('active')) {
                                arizasonuclandirma.value = "1";
                            }
                            else {
                                arizasonuclandirma.value = "0";
                            }
                            break;
                        case 5:
                            var stokkartiekleme = document.getElementById('stokkartieklemevarmi');
                            if (this.classList.contains('active')) {
                                stokkartiekleme.value = "1";
                            }
                            else {
                                stokkartiekleme.value = "0";
                            }
                            break;
                        case 6:
                            var stokgirisiyapma = document.getElementById('stokgirisiyapmavarmi');
                            if (this.classList.contains('active')) {
                                stokgirisiyapma.value = "1";
                            }
                            else {
                                stokgirisiyapma.value = "0";
                            }
                            break;
                        case 7:
                            var stokcikisiyapma = document.getElementById('stokcikisiyapmavarmi');
                            if (this.classList.contains('active')) {
                                stokcikisiyapma.value = "1";
                            }
                            else {
                                stokcikisiyapma.value = "0";
                            }
                            break;
                        case 8:
                            var sayacekleme = document.getElementById('sayaceklemevarmi');
                            if (this.classList.contains('active')) {
                                sayacekleme.value = "1";
                            }
                            else {
                                sayacekleme.value = "0";
                            }
                            break;
                        case 9:
                            var sayacsilme = document.getElementById('sayacsilmevarmi');
                            if (this.classList.contains('active')) {
                                sayacsilme.value = "1";
                            }
                            else {
                                sayacsilme.value = "0";
                            }
                            break;
                        case 10:
                            var sayacislemgirme = document.getElementById('sayacislemgirmevarmi');
                            if (this.classList.contains('active')) {
                                sayacislemgirme.value = "1";
                            }
                            else {
                                sayacislemgirme.value = "0";
                            }
                            break;
                        case 11:
                            var sayacguncelleme = document.getElementById('sayacguncellemevarmi');
                            if (this.classList.contains('active')) {
                                sayacguncelleme.value = "1";
                            }
                            else {
                                sayacguncelleme.value = "0";
                            }
                            break;
                        case 12:
                            var periyodikbakimekleme = document.getElementById('periyodikbakimeklemevarmi');
                            if (this.classList.contains('active')) {
                                periyodikbakimekleme.value = "1";
                            }
                            else {
                                periyodikbakimekleme.value = "0";
                            }
                            break;
                        case 13:
                            var periyodikbakimsil = document.getElementById('periyodikbakimsilmevarmi');
                            if (this.classList.contains('active')) {
                                periyodikbakimsil.value = "1";
                            }
                            else {
                                periyodikbakimsil.value = "0";
                            }
                            break;
                        case 14:
                            var periyodikbakimguncelle = document.getElementById('periyodikbakimguncellemevarmi');
                            if (this.classList.contains('active')) {
                                periyodikbakimguncelle.value = "1";
                            }
                            else {
                                periyodikbakimguncelle.value = "0";
                            }
                            break;
                    }

                });
            }

        }

        window.onload = function () {
            var tumKullaniciDivs = document.getElementsByClassName('kullanicidiv');
            for (var i = 0; i < tumKullaniciDivs.length; i++) {
                var varmiyokmuDiv = tumKullaniciDivs[i].getElementsByClassName('varmıyokmu')[0];
                var toggleBtn = tumKullaniciDivs[i].getElementsByClassName('toggle-btn')[0];
                var duzenlemeID = 'duzenlebuton_' + i.toString();

                if (varmiyokmuDiv.innerHTML.trim() === "1") {
                    toggleBtn.classList.add('active');
                }

                //toggleBtn.addEventListener('click', function () {
                //    if (document.getElementById('Repeater1_ctl00_Duzenleniyormu').value === "1") {
                //        this.classList.toggle('active');
                //    }
                //});

                //var duzenlemeBtn = document.getElementById(duzenlemeID);
                //duzenlemeBtn.addEventListener('click', function () {
                //    duzenlemeyiaktiflestir(duzenlemeID);
                //});
            }
        };


        function toggleList() {
            var liste = document.getElementById('profil-liste');
            liste.classList.toggle('goster');
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
