Imports System.Data.SqlClient
Imports System.Globalization
Imports System.IO
Imports System.Security.Cryptography
Imports DevExpress.Web
Imports DevExpress.XtraRichEdit.Model

Public Class anasayfa
    Inherits System.Web.UI.Page

    Dim baglan1 As New SqlConnection
    Dim cmd1 As New SqlCommand
    Dim oku1 As SqlDataReader

    Dim cmd2 As New SqlCommand

    Dim baglan2 As New SqlConnection
    Dim cmd3 As New SqlCommand
    Dim oku2 As SqlDataReader

    Dim baglan4 As New SqlConnection
    Dim cmd4 As New SqlCommand
    Dim oku4 As SqlDataReader

    Dim baglan9 As New SqlConnection
    Dim cmd9 As New SqlCommand

    Dim baglan10 As New SqlConnection
    Dim cmd10 As New SqlCommand
    Dim oku10 As SqlDataReader

    Dim oku As SqlDataReader
    Dim oku3 As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim sayi As Integer

        arizadidentry.Text = RandomIdOlustur().ToString()

        'Dim simdi As DateTime = DateTime.Now

        'dosyayiac.NavigateUrl = Session("dosyaBurada")

        'baglan5.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        'baglan5.Open()
        'cmd5.Parameters.Clear()
        'cmd5.CommandText = "SELECT COUNT(*) AS maxsayi FROM master_bakim"
        'cmd5.Connection = baglan5
        'oku5 = cmd5.ExecuteReader

        'If oku5.Read Then
        '    sayi = Convert.ToInt32(oku5("maxsayi"))
        'End If

        'oku5.Close()

        'For iterasyon As Integer = 0 To sayi

        '    Dim ariza_id As Integer

        '    cmd6.CommandText = "SELECT * FROM master_bakim WHERE id =" + iterasyon.ToString() + " AND sonuc='Sonuçlanmadı'"
        '    cmd6.Connection = baglan5

        '    oku6 = cmd6.ExecuteReader

        '    If oku6.Read Then
        '        ariza_id = Convert.ToInt32(oku6("ariza_id"))

        '        oku6.Close()

        '        cmd7.CommandText = "SELECT * FROM islem_hareket WHERE ariza_id=" + ariza_id.ToString() + " AND sonuc='Sonuçlandı'"
        '        cmd7.Connection = baglan5

        '        oku7 = cmd7.ExecuteReader

        '        If oku7.Read Then

        '            oku7.Close()

        '            Dim etki1 As Integer

        '            cmd8.CommandText = "UPDATE master_bakim SET sonuc = 'Sonuçlandı' WHERE ariza_id=" + ariza_id.ToString()
        '            cmd8.Connection = baglan5

        '            etki1 = cmd8.ExecuteNonQuery

        '        Else
        '            oku7.Close()
        '        End If
        '    Else
        '        oku6.Close()
        '    End If

        'Next
        'baglan5.Close()

        verial()

    End Sub

    Private Function RandomIdOlustur() As Integer
        Dim random As New Random()
        Return random.Next(100000, 999999)
    End Function

    Protected Sub verial()

        Dim temp As Integer

        baglan2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan2.Open()
        cmd3.Parameters.Clear()
        cmd3.CommandText = "UPDATE master_bakim SET gecen_zaman = CONCAT( DATEDIFF(DAY, tarih, GETDATE()), ' gün ', DATEDIFF(HOUR, tarih, GETDATE()) % 24, ' saat ', DATEDIFF(HOUR, tarih, GETDATE()) % 60, ' dakika') WHERE sonuc = 'Sonuçlanmadi' AND firma_id = @firma_id"
        cmd3.Parameters.AddWithValue("@firma_id", Session("firmID"))
        cmd3.Connection = baglan2

        temp = cmd3.ExecuteNonQuery

        'cmd4.Parameters.Clear()
        'cmd4.CommandText = "UPDATE master_bakim SET gecen_zaman = CONVERT(NVARCHAR(20), DATEDIFF(DAY, tarih, sonuc_tarih)) + ' gün ' + CONVERT(NVARCHAR(20), DATEDIFF(HOUR, tarih, sonuc_tarih) % 24) + ' saat ' + CONVERT(NVARCHAR(20), DATEDIFF(MINUTE, tarih, sonuc_tarih) % 60) + ' dakika' WHERE sonuc = 'Sonuçlandi' AND firma_id = @firma_id"
        'cmd4.Parameters.AddWithValue("@firma_id", Session("firmID"))
        'cmd4.Connection = baglan2

        'temp2 = cmd4.ExecuteNonQuery()
        baglan2.Close()

        SqlDataSource1.SelectCommand = ""

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM view_ariza_ana WHERE firma_id =" + Session("firmID").ToString() + "AND sil_durum1 = 0"

    End Sub

    'Protected Sub verial2(intarih As DateTime, arizaID As Integer)


    '    Dim temp As Integer
    '    Dim simdi As DateTime = DateTime.Now
    '    Dim simdiV2 As String = simdi.ToString("yyyy-MM-dd")
    '    Dim simdison As DateTime = Convert.ToDateTime(simdiV2)

    '    baglan2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
    '    baglan2.Open()
    '    cmd3.Parameters.Clear()

    '    If intarih > simdison Then
    '        cmd3.CommandText = "UPDATE master_bakim SET gecen_zaman = "
    '    End If

    '    cmd3.CommandText = "UPDATE master_bakim SET gecen_zaman = CONCAT( DATEDIFF(DAY, tarih, GETDATE()), ' gün ', DATEDIFF(HOUR, tarih, GETDATE()) % 24, ' saat ', DATEDIFF(HOUR, tarih, GETDATE()) % 60, ' dakika') WHERE sonuc = 'Sonuçlanmadi' AND firma_id = @firma_id"
    '    cmd3.Parameters.AddWithValue("@firma_id", Session("firmID"))
    '    cmd3.Connection = baglan2

    '    temp = cmd3.ExecuteNonQuery


    '    baglan2.Close()

    '    SqlDataSource1.SelectCommand = ""

    '    SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
    '    SqlDataSource1.SelectCommand = "SELECT * FROM view_ariza_ana WHERE firma_id =" + Session("firmID").ToString() + "AND sil_durum1 = 0"

    'End Sub

    Protected Sub ariza_akle_Click(sender As Object, e As EventArgs)

        If (Session("ariza_ekle").ToString() = "1") Then

            Dim dosyakayit As String
            Dim yeniDosyaAdi As String
            Dim dosyaAdiSon As String

            'arizaturulabel.Text = selectedAriza.Value.ToString()
            If FileUpload1.HasFiles Then

                Dim dosyayolu As String = Server.MapPath("~/dosyalar/")
                Dim sessionDegeri As String = Session("firma").ToString() ' Session'dan değeri al
                Dim labelDegeri As String = arizadidentry.Text ' Label'ın Text parametresini al
                yeniDosyaAdi = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload1.FileName)}"

                FileUpload1.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi))

                'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
                'dosyakayitdeneme.Text = yeniDosyaAdi
                dosyakayit = Path.Combine(dosyayolu, yeniDosyaAdi)
                dosyaAdiSon = "~/dosyalar/" + yeniDosyaAdi

            Else
                'dosya seçilmediyse
                dosyakayitdeneme.Text = "Dosya seçilmedi"
            End If

            'Try

            Dim tarihformat As DateTime = txtarizaDate.Text
            Dim gelentarih As String = tarihformat.ToString("yyyyy-MM-dd")


            Dim affected As Integer
            Dim planTarih As DateTime
            Dim sonucsuz As String = "Sonuçlanmadı"

            baglan1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan1.Open()
            cmd1.Parameters.Clear()
            cmd1.CommandText = "INSERT INTO master_bakim (ariza_turu, makkod, islem_acan, baslik, aciklama, tarih, plan_tarih, ariza_id, sonuc, sonuc_bitiren, durum, dosya, firma_id, type, sil_durum1) VALUES (@ariza_turu, @makkod, @islem_acan, @baslik, @aciklama, @tarih, @plan_tarih, @ariza_id, @sonuc, @sonuc, @sonuc, @dosya, @firma_id, @type, 0)"
            cmd1.Parameters.AddWithValue("@ariza_turu", Arizatur.SelectedValue)
            cmd1.Parameters.AddWithValue("@type", typeentry.SelectedValue)
            cmd1.Parameters.AddWithValue("@makkod", makkodentry.Text)
            cmd1.Parameters.AddWithValue("@islem_acan", islemacanentry.Text)
            cmd1.Parameters.AddWithValue("@baslik", baslikentry.Text)
            cmd1.Parameters.AddWithValue("@ariza_id", arizadidentry.Text)
            cmd1.Parameters.AddWithValue("@aciklama", If(String.IsNullOrEmpty(aciklamaentry.Text), "-", aciklamaentry.Text))
            cmd1.Parameters.AddWithValue("@dosya", If(String.IsNullOrEmpty(dosyaAdiSon), "-", dosyaAdiSon))
            cmd1.Parameters.AddWithValue("@tarih", Convert.ToDateTime(gelentarih))
            cmd1.Parameters.AddWithValue("@sonuc", sonucsuz)
            cmd1.Parameters.AddWithValue("@firma_id", Session("firmID"))
            ' Kullanıcı bir değer girmişse ve geçerli bir tarihse, değeri al
            If Not String.IsNullOrEmpty(txtplanDate.Text) AndAlso DateTime.TryParse(txtplanDate.Text, planTarih) Then
                cmd1.Parameters.AddWithValue("@plan_tarih", planTarih)
            Else
                ' Kullanıcı bir değer girmemişse veya geçerli bir tarih değilse, NULL olarak belirt
                cmd1.Parameters.AddWithValue("@plan_tarih", DBNull.Value)
            End If
            cmd1.Connection = baglan1

            affected = cmd1.ExecuteNonQuery()
            baglan1.Close()
            If affected > 0 Then

                'arizaturuentry.Text = ""
                makkodentry.Text = ""
                islemacanentry.Text = ""
                baslikentry.Text = ""
                aciklamaentry.Text = ""
                txtarizaDate.Text = ""
                txtplanDate.Text = ""
                arizadidentry.Text = ""

                verial()


            Else
                uyarilabel.Text = "Kayıt işlemi başarısız. Girilen bilgileri kontrol edip tekrar deneyiniz."
                uyarilabel.Visible = True
            End If

            baglan1.Close()
            'Catch ex As Exception
            '    uyarilabel.Text = "Kayıt işlemi başarısız. Girilen bilgileri kontrol edip tekrar deneyiniz. Hata ;" + ex.Message
            '    uyarilabel.Visible = True
            'End Try


        Else
            dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
        End If

    End Sub

    Protected Sub islem_ekle_Click(sender As Object, e As EventArgs)

        'Try

        Dim yeniDosyaAdi1 As String
        Dim dosyakayit1 As String
        Dim dosyaAdiSon1 As String

        If FileUpload2.HasFiles Then

            Dim dosyayolu As String = Server.MapPath("~/islemDosyalar/")
            Dim sessionDegeri As String = Session("firma").ToString() ' Session'dan değeri al
            Dim labelDegeri As String = arizadidentry.Text ' Label'ın Text parametresini al
            yeniDosyaAdi1 = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload2.FileName)}"

            FileUpload2.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi1))

            'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
            dosyakayit1 = Path.Combine(dosyayolu, yeniDosyaAdi1)

            dosyaAdiSon1 = "~/islemDosyalar/" + yeniDosyaAdi1
            'dosyakayitdeneme.Text = dosyaAdiSon1

        Else
            'dosya seçilmediyse
            dosyakayitdeneme.Text = "Dosya seçilmedi !"
        End If

        Dim mindate As DateTime
        Dim mindateV2 As String
        Dim mindateSon As DateTime
        Dim trydate As DateTime = Convert.ToDateTime(TextBox6.Text)

        Dim compdate As DateTime = TextBox6.Text
        Dim compdateV2 As String = compdate.ToString("yyyy-MM-dd")
        Dim compdateson As DateTime = Convert.ToDateTime(compdateV2)

        Dim sonucTarih As DateTime
        If String.IsNullOrEmpty(TextBox11.Text) Then
            sonucTarih = Nothing
        Else
            sonucTarih = Convert.ToDateTime(TextBox11.Text)
        End If
        Dim simdi As DateTime = DateTime.Now
        Dim compare As Integer
        Dim arizaSonuc As String
        'Dim selectedresult As String = selectedSonuc.Value.ToString()
        Dim selectedresult As String = Sonuctur.SelectedValue


        baglan10.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan10.Open()
        cmd10.Parameters.Clear()
        cmd10.CommandText = "SELECT tarih, sonuc FROM master_bakim WHERE firma_id = @firma_id AND ariza_id = @ariza_id2"
        cmd10.Parameters.AddWithValue("@ariza_id2", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
        cmd10.Parameters.AddWithValue("@firma_id", Session("firmID"))
        cmd10.Connection = baglan10
        oku10 = cmd10.ExecuteReader

        If oku10.Read Then
            mindate = Convert.ToDateTime(oku10("tarih"))
            arizaSonuc = oku10("sonuc").ToString()
        End If
        oku10.Close()
        baglan10.Close()

        mindateV2 = mindate.ToString("yyyy-MM-dd")
        mindateSon = Convert.ToDateTime(mindateV2)

        If selectedresult = "Sonuçlandı" AndAlso arizaSonuc = "Sonuçlandi" Then

            'Response.Write("sonuclanan bir ariza tekrar sonuclandirilamaz")

            dosyakayitdeneme.Text = "Bu arıza kaydı zaten sonuçlandırılmış"
            dosyakayitdeneme.Visible = True

            Label3.Text = "Bu arıza kaydı zaten sonuçlandırılmış"
            Label3.Visible = True

        ElseIf arizaSonuc = "Sonuçlanmadi" Then

            compare = mindateSon.CompareTo(compdateson)

            If compare > 0 Then

                'Response.Write("İşlem tarihi, arıza tarihinden önce olamaz!")

                dosyakayitdeneme.Text = "İşlem tarihi, arıza tarihinden önce olamaz!"
                dosyakayitdeneme.Visible = True

                Label3.Text = "İşlem tarihi, arıza tarihinden önce olamaz!"
                Label3.Visible = True

            ElseIf compare < 0 Then


                'BURADA KONTROL ET !!!!!!!!!!!!!!!!!!

                If (selectedresult = "Sonuçlandı") Then

                    If (Session("ariza_sonuclandir").ToString() = "1") Then

                        Dim affectedd As Integer

                        Dim fark As TimeSpan = sonucTarih - mindate
                        Dim gunFark As Integer = fark.Days
                        Dim stringFark As String = gunFark.ToString()

                        Dim islemtarih As DateTime = TextBox6.Text
                        Dim islemtarihson As String = islemtarih.ToString("yyyy-MM-dd")


                        baglan4.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                        baglan4.Open()
                        cmd4.Parameters.Clear()
                        cmd4.CommandText = "INSERT INTO islem_hareket (ariza_id_islem, baslik, islem_aciklama, islem_yapan, tarih_islem, sonuc, sonuc_tarih, dosya1, firma_id) VALUES (@ariza_id, @baslik, @islem_aciklama, @islem_yapan, @tarih, @sonuc, @sonuc_tarih, @dosya1, @firma_id)"
                        cmd4.Parameters.AddWithValue("@ariza_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
                        cmd4.Parameters.AddWithValue("@baslik", TextBox7.Text)
                        cmd4.Parameters.AddWithValue("@islem_aciklama", TextBox10.Text)
                        cmd4.Parameters.AddWithValue("@islem_yapan", TextBox8.Text)
                        cmd4.Parameters.AddWithValue("@tarih", Convert.ToDateTime(islemtarihson))
                        cmd4.Parameters.AddWithValue("@sonuc", selectedresult)
                        cmd4.Parameters.AddWithValue("@dosya1", If(String.IsNullOrEmpty(dosyaAdiSon1), "-", dosyaAdiSon1))
                        cmd4.Parameters.AddWithValue("@firma_id", Session("firmID"))

                        If String.IsNullOrEmpty(TextBox11.Text) Then
                            ' Eğer TextBox11.Text boşsa, NULL
                            cmd4.Parameters.AddWithValue("@sonuc_tarih", DBNull.Value)
                        Else
                            ' Eğer TextBox11.Text değeri varsa, bu değeri parametreye ekle
                            cmd4.Parameters.AddWithValue("@sonuc_tarih", TextBox11.Text)
                        End If

                        cmd4.Connection = baglan4

                        affectedd = cmd4.ExecuteNonQuery()

                        If affectedd > 0 Then

                            If selectedresult = "Sonuçlandı" Then

                                duzenle2()

                            Else
                                duzenle()
                            End If

                        Else
                            Label3.Text = "İşlem kaydedilirken bir sorun oluştu. Girilen verileri kontrol ediniz."
                            Label3.Visible = True
                        End If

                    Else
                        dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
                    End If

                Else

                    Dim affectedd As Integer

                    Dim fark As TimeSpan = sonucTarih - mindate
                    Dim gunFark As Integer = fark.Days
                    Dim stringFark As String = gunFark.ToString()

                    Dim islemtarih As DateTime = TextBox6.Text
                    Dim islemtarihson As String = islemtarih.ToString("yyyy-MM-dd")


                    baglan4.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                    baglan4.Open()
                    cmd4.Parameters.Clear()
                    cmd4.CommandText = "INSERT INTO islem_hareket (ariza_id_islem, baslik, islem_aciklama, islem_yapan, tarih_islem, sonuc, sonuc_tarih, dosya1, firma_id) VALUES (@ariza_id, @baslik, @islem_aciklama, @islem_yapan, @tarih, @sonuc, @sonuc_tarih, @dosya1, @firma_id)"
                    cmd4.Parameters.AddWithValue("@ariza_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
                    cmd4.Parameters.AddWithValue("@baslik", TextBox7.Text)
                    cmd4.Parameters.AddWithValue("@islem_aciklama", TextBox10.Text)
                    cmd4.Parameters.AddWithValue("@islem_yapan", TextBox8.Text)
                    cmd4.Parameters.AddWithValue("@tarih", Convert.ToDateTime(islemtarihson))
                    cmd4.Parameters.AddWithValue("@sonuc", selectedresult)
                    cmd4.Parameters.AddWithValue("@dosya1", If(String.IsNullOrEmpty(dosyaAdiSon1), "-", dosyaAdiSon1))
                    cmd4.Parameters.AddWithValue("@firma_id", Session("firmID"))

                    If String.IsNullOrEmpty(TextBox11.Text) Then
                        ' Eğer TextBox11.Text boşsa, NULL
                        cmd4.Parameters.AddWithValue("@sonuc_tarih", DBNull.Value)
                    Else
                        ' Eğer TextBox11.Text değeri varsa, bu değeri parametreye ekle
                        cmd4.Parameters.AddWithValue("@sonuc_tarih", TextBox11.Text)
                    End If

                    cmd4.Connection = baglan4

                    affectedd = cmd4.ExecuteNonQuery()

                    If affectedd > 0 Then

                        If selectedresult = "Sonuçlandı" Then

                            duzenle2()

                        Else
                            duzenle()
                        End If

                    Else
                        Label3.Text = "İşlem kaydedilirken bir sorun oluştu. Girilen verileri kontrol ediniz."
                        Label3.Visible = True
                    End If

                End If

                'İŞLEMLER BURADA BİTİYOR !!!!!!!!!!!!!!!!!!!!!
            End If
                baglan4.Close()
        Else
            MsgBox("if blokları çalışmıyor ! seçili kaydın sonuçlanma durumu : " + arizaSonuc.ToString() + "Yapılmak istenen işlem sonucu" + selectedresult.ToString())
        End If

        'Catch ex As Exception

        '    Label3.Text = "İşlem gerçekleştirilirken hata oluştu. Hata ;" + ex.Message
        '    Label3.Visible = True

        'End Try

    End Sub

    Protected Sub duzenle()

        'Try

        'Dim bisey As String = "Sonuçlandı"
        Dim subaffected As Integer

        baglan9.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan9.Open()
        cmd9.Parameters.Clear()
        cmd9.CommandText = "UPDATE master_bakim SET son_islem_yapan=@son_islem_yapan WHERE firma_id = @firma_id AND ariza_id = @ariza_id1"
        'cmd9.Parameters.AddWithValue("@sondurum", bisey)
        cmd9.Parameters.AddWithValue("@son_islem_yapan", TextBox8.Text)
        'cmd9.Parameters.AddWithValue("@sonuc_tarih", TextBox11.Text)
        'cmd9.Parameters.AddWithValue("@durum", bisey)
        cmd9.Parameters.AddWithValue("@ariza_id1", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
        'cmd9.Parameters.AddWithValue("@sure", sure)
        cmd9.Parameters.AddWithValue("@firma_id", Session("firmID"))
        cmd9.Connection = baglan9
        subaffected = cmd9.ExecuteNonQuery()

        If subaffected > 0 Then

            TextBox7.Text = ""
            TextBox10.Text = ""
            TextBox8.Text = ""
            TextBox6.Text = ""

            verial()
        Else
            Label3.Text = "İşlem kaydedilirken bir sorun oluştu. Girilen verileri kontrol ediniz."
            Label3.Visible = True
        End If

        baglan9.Close()
        'Catch ex As Exception

        '    Label3.Text = "İşlem gerçekleştirilirken hata oluştu. Hata ;" + ex.Message
        '    Label3.Visible = True

        'End Try

    End Sub

    Protected Sub duzenle2()

        'Try

        Dim datething As DateTime = TextBox6.Text
        Dim datethingSon As String = datething.ToString("yyyy-MM-dd")

        Dim bisey As String = "Sonuçlandı"
        Dim subaffected As Integer

        baglan9.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan9.Open()
        cmd9.Parameters.Clear()
        cmd9.CommandText = "UPDATE master_bakim SET sonuc=@sondurum, sonuc_bitiren=@bitiren, son_islem_yapan=@bitiren, sonuc_tarih=@sonuc_tarih, durum=@durum, gecen_zaman = CONCAT(DATEDIFF(DAY, tarih, @sonucTarih), ' gün ', DATEDIFF(HOUR, tarih, @sonucTarih) % 24, ' saat ', DATEDIFF(HOUR, tarih, @sonucTarih) % 60, ' dakika ') WHERE firma_id = @firma_id AND ariza_id = @ariza_id1"
        cmd9.Parameters.AddWithValue("@sondurum", bisey)
        cmd9.Parameters.AddWithValue("@bitiren", TextBox8.Text)
        cmd9.Parameters.AddWithValue("@sonuc_tarih", Convert.ToDateTime(datethingSon))
        cmd9.Parameters.AddWithValue("@durum", bisey)
        cmd9.Parameters.AddWithValue("@ariza_id1", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
        cmd9.Parameters.AddWithValue("@sonucTarih", Convert.ToDateTime(datethingSon))
        cmd9.Parameters.AddWithValue("@firma_id", Session("firmID"))
        cmd9.Connection = baglan9
        subaffected = cmd9.ExecuteNonQuery()

        If subaffected > 0 Then

            TextBox7.Text = ""
            TextBox10.Text = ""
            TextBox8.Text = ""
            TextBox6.Text = ""

            verial()
        Else
            Label3.Text = "İşlem kaydedilirken bir sorun oluştu. Girilen verileri kontrol ediniz."
            Label3.Visible = True
        End If

        baglan9.Close()
        'Catch ex As Exception

        '    Label3.Text = "İşlem gerçekleştirilirken hata oluştu. Hata ;" + ex.Message
        '    Label3.Visible = True

        'End Try

    End Sub

    Private Sub ASPxGridView1_FocusedRowChanged(sender As Object, e As EventArgs) Handles ASPxGridView1.FocusedRowChanged

        If ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex) IsNot Nothing Then
            Session("eladio2") = ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id")

            'Dim dosya1 As String
            'Dim dosya2 As String
            'Dim dosyason As String

            'dosya1 = "~/dosyalar/"
            ''MsgBox("Burda herşey yolunda !")

            'baglan2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            'baglan2.Open()
            'cmd3.Parameters.Clear()
            'cmd3.CommandText = "SELECT dosya FROM master_bakim WHERE firma_id = @firma_id AND ariza_id = @arizaID"
            'cmd3.Parameters.AddWithValue("@arizaID", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
            'cmd3.Parameters.AddWithValue("@firma_id", Session("firmID"))
            'cmd3.Connection = baglan2
            'oku2 = cmd3.ExecuteReader()
            'If oku2.Read Then
            '    dosya2 = oku2("dosya").ToString()
            '    dosyason = dosya1 + dosya2

            'End If

            'oku2.Close()
            'baglan2.Close()

        End If

    End Sub

    Protected Sub silbuton_Click(sender As Object, e As EventArgs)

        If (Session("ariza_sil").ToString() = "1") Then
            Dim affected As Integer

            baglan2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan2.Open()
            cmd3.Parameters.Clear()
            cmd3.CommandText = "UPDATE master_bakim SET sil_durum1 = 1 WHERE ariza_id = @arizaID AND firma_id = @firma_id"
            cmd3.Parameters.AddWithValue("@arizaID", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
            cmd3.Parameters.AddWithValue("@firma_id", Session("firmID"))
            cmd3.Connection = baglan2

            affected = cmd3.ExecuteNonQuery
            If affected > 0 Then
                verial()
            End If
            baglan2.Close()
        Else
            dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
        End If


    End Sub

    Protected Sub excelaktar_Click(sender As Object, e As EventArgs)

        gridExporter.WriteXlsToResponse()

    End Sub

    Protected Sub pdfaktar_Click(sender As Object, e As EventArgs)

        gridExporter.WritePdfToResponse()

    End Sub

    Protected Sub guncellebtn_Click(sender As Object, e As EventArgs)

        Try
            If (Session("ariza_guncelle").ToString() = "1") Then

                Dim dosyakayitC As String
                Dim yeniDosyaAdiC As String
                Dim dosyaAdiSonC As String
                Dim affected As Integer

                If FileUpload3.HasFiles Then

                    Dim dosyayolu As String = Server.MapPath("~/dosyalar/")
                    Dim sessionDegeri As String = Session("firma").ToString() + "Current" ' Session'dan değeri al
                    Dim labelDegeri As String = arizadidentry.Text ' Label'ın Text parametresini al
                    yeniDosyaAdiC = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload3.FileName)}"

                    FileUpload3.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdiC))

                    dosyakayitC = Path.Combine(dosyayolu, yeniDosyaAdiC)
                    dosyaAdiSonC = "~/dosyalar/" + yeniDosyaAdiC

                Else
                    'dosya seçilmediyse
                    dosyakayitdeneme.Text = "Dosya seçilmedi"
                End If

                baglan2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                baglan2.Open()
                cmd3.Parameters.Clear()
                cmd3.CommandText = "UPDATE master_bakim SET tarih = @tarih, plan_tarih = @planlitarih, ariza_turu = @ariza_turu, type = @type, makkod = @makkod, islem_acan = @islem_acan, baslik = @baslik, aciklama = @aciklama, dosya = @dosya WHERE ariza_id = @arizaID AND firma_id = @firma_id"
                cmd3.Parameters.AddWithValue("@arizaID", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("ariza_id"))
                cmd3.Parameters.AddWithValue("@firma_id", Session("firmID"))

                If Not String.IsNullOrEmpty(guncelledate.Text) Then
                    cmd3.Parameters.AddWithValue("@tarih", guncelledate.Text)
                Else
                    cmd3.Parameters.AddWithValue("@tarih", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("tarih"))
                End If

                If Not String.IsNullOrEmpty(guncelleplandate.Text) Then
                    cmd3.Parameters.AddWithValue("@planlitarih", guncelleplandate.Text)
                ElseIf Not String.IsNullOrEmpty(ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("plan_tarih")) Then
                    cmd3.Parameters.AddWithValue("@planlitarih", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("plan_tarih"))
                Else
                    cmd3.Parameters.AddWithValue("@planlitarih", DBNull.Value)
                End If

                cmd3.Parameters.AddWithValue("@ariza_turu", guncellearizatur.SelectedValue)
                cmd3.Parameters.AddWithValue("@type", guncelletype.SelectedValue)
                cmd3.Parameters.AddWithValue("@makkod", guncellemakkod.Text)
                cmd3.Parameters.AddWithValue("@islem_acan", guncelleislemacan.Text)
                cmd3.Parameters.AddWithValue("@baslik", guncellebaslik.Text)
                cmd3.Parameters.AddWithValue("@aciklama", If(String.IsNullOrEmpty(guncelleaciklama.Text), "-", guncelleaciklama.Text))
                cmd3.Parameters.AddWithValue("@dosya", If(String.IsNullOrEmpty(dosyaAdiSonC), "-", dosyaAdiSonC))

                'If Not String.IsNullOrEmpty(guncelleaciklama.Text) Then
                '    cmd3.Parameters.AddWithValue("@aciklama", guncelleaciklama.Text)
                'ElseIf Not String.IsNullOrEmpty(ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("aciklama")) Then
                '    cmd3.Parameters.AddWithValue("@aciklama", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("aciklama"))
                'Else
                '    cmd3.Parameters.AddWithValue("@aciklama", DBNull.Value)
                'End If

                cmd3.Connection = baglan2

                If affected > 0 Then

                    guncelleaciklama.Text = ""
                    guncellebaslik.Text = ""
                    guncelleislemacan.Text = ""
                    guncellemakkod.Text = ""
                    guncelledate.Text = ""
                    guncelleplandate.Text = ""

                    verial()
                Else
                    guncellewarning.Text = "Güncelleme işlemi sırasında bir hata oluştu. Girilen verileri kontrol edip tekrar deneyiniz."
                    guncellewarning.Visible = True
                End If

            Else
                guncellewarning.Text = "Bu işlemi yapma yetkiniz yok"
            End If



        Catch ex As Exception

            guncellewarning.Text = "Güncelleme işlemi sırasında bir hata oluştu. Girilen verileri kontrol edip tekrar deneyiniz."
            guncellewarning.Visible = True

        End Try

    End Sub

    Protected Sub cikisyap_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub ayarlarbuton_Click(sender As Object, e As EventArgs)
        If (Session("yetki").ToString() = "1") Then
            Response.Redirect("adminislemler.aspx")
        End If

    End Sub
End Class