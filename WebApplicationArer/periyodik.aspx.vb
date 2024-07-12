Imports System.Data.SqlClient
Imports System.IO

Public Class periyodik
    Inherits System.Web.UI.Page

    Dim baglan As New SqlConnection
    Dim cmd As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        verial()

    End Sub

    Protected Sub verial()

        SqlDataSource1.SelectCommand = ""
        SqlDataSource3.SelectCommand = ""

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM ana_periyodik WHERE sil_durum = 0 AND firma_id =" + Session("firmID").ToString()

        SqlDataSource3.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource3.SelectCommand = "SELECT * FROM varliklar1 WHERE firma_id =" + Session("firmID").ToString()

    End Sub

    Private Function RandomIdOlustur() As Integer
        Dim random As New Random()
        Return random.Next(100000, 999999)
    End Function

    Protected Sub varlik_sil_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "DELETE FROM varliklar1 WHERE id = @id AND firma_id = @firmID"
        cmd.Parameters.AddWithValue("@id", ASPxGridView3.GetDataRow(ASPxGridView3.FocusedRowIndex).Item("id"))
        cmd.Parameters.AddWithValue("@firmID", Session("firmID")) 'Session("firmID")
        cmd.Connection = baglan

        affected = cmd.ExecuteNonQuery
        If affected > 0 Then
            verial()
        End If
        baglan.Close()

    End Sub

    Protected Sub varlik_ekle_btn_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "INSERT INTO varliklar1 (varlik_isim, firma_id) VALUES (@varlik_isim, @firma_id)"
        cmd.Parameters.AddWithValue("@varlik_isim", varlikentrytxtbox.Text)
        cmd.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
        cmd.Connection = baglan

        affected = cmd.ExecuteNonQuery()

        If affected > 0 Then
            varlikentrytxtbox.Text = ""
            verial()
        End If

        baglan.Close()

    End Sub

    Protected Sub periyodik_bakim_ekle_Click(sender As Object, e As EventArgs)

        Try

            If (Session("pbakim_ekle").ToString() = "1") Then

                Dim yeniDosyaAdi As String
                Dim dosyakayit As String
                Dim dosyaAdiSon As String


                If FileUpload1.HasFiles Then

                    Dim dosyayolu As String = Server.MapPath("~/periyodikDosyalar/")
                    Dim sessionDegeri As String = Session("firma").ToString() ' Session'dan değeri al
                    Dim labelDegeri As String = RandomIdOlustur() ' Label'ın Text parametresini al
                    yeniDosyaAdi = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload1.FileName)}"

                    FileUpload1.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi))

                    'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
                    'dosyakayitdeneme.Text = yeniDosyaAdi
                    dosyakayit = Path.Combine(dosyayolu, yeniDosyaAdi)
                    dosyaAdiSon = "~/periyodikDosyalar/" + yeniDosyaAdi

                Else
                    'dosya seçilmediyse
                    dosyakayitdeneme.Text = "Dosya seçilmedi"
                End If

                Dim affected As Integer

                baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                baglan.Open()
                cmd.Parameters.Clear()
                cmd.CommandText = "INSERT INTO ana_periyodik (pbakim_id, pbakim_atanan_per, pbakim_varlik, pbakim_periyod, pbakim_basla_tarih, pbakim_bitis_tarih, pbakim_durum, pbakim_islem_durum, pbakim_dosya, pbakim_planli_tarih, pbakim_aciklama, firma_id, sil_durum, pbakim_makkod) VALUES (@pbakim_id, @pbakim_atanan_per, @pbakim_varlik, @pbakim_periyod, @pbakim_basla_tarih, @pbakim_bitis_tarih, @pbakim_durum, @pbakim_islem_durum, @pbakim_dosya, @pbakim_planli_tarih, @pbakim_aciklama, @firma_id, 0, @pbakim_makkod)"
                cmd.Parameters.AddWithValue("@pbakim_id", RandomIdOlustur())
                cmd.Parameters.AddWithValue("@pbakim_atanan_per", periyodikpersonelentry.Text)
                cmd.Parameters.AddWithValue("@pbakim_varlik", periyodikvarlikselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_periyod", periyodikperiyodselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_basla_tarih", Convert.ToDateTime(periyodikbaslatarih.Text))
                cmd.Parameters.AddWithValue("@pbakim_bitis_tarih", Convert.ToDateTime(periyodikbitistarih.Text))
                cmd.Parameters.AddWithValue("@pbakim_durum", periyodikdurumselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_islem_durum", periyodikislemdurumselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_dosya", If(String.IsNullOrEmpty(dosyaAdiSon), "-", dosyaAdiSon))
                cmd.Parameters.AddWithValue("@pbakim_planli_tarih", Convert.ToDateTime(periyodikplandate.Text))
                cmd.Parameters.AddWithValue("@pbakim_makkod", periyodikmakineentry.Text)
                cmd.Parameters.AddWithValue("@pbakim_aciklama", periyodikaciklamalentry.Text)
                cmd.Parameters.AddWithValue("@firma_id", Session("firmID"))

                cmd.Connection = baglan

                affected = cmd.ExecuteNonQuery()

                If affected > 0 Then
                    periyodikaciklamalentry.Text = ""
                    periyodikpersonelentry.Text = ""
                    verial()
                Else
                    dosyakayitdeneme.Text = "Kayıt işlemi esnasında hata oluştu. Lütfen girilen verileri kontrol edip tekrar deneyiniz."
                    dosyakayitdeneme.Visible = True
                End If

                baglan.Close()


            Else
                dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
                dosyakayitdeneme.Visible = True
            End If

        Catch ex As Exception

            dosyakayitdeneme.Text = "Kayıt işlemi esnasında hata oluştu. Lütfen girilen verileri kontrol edip tekrar deneyiniz."
            dosyakayitdeneme.Visible = True

        End Try

    End Sub

    Protected Sub silbuton_Click(sender As Object, e As EventArgs)

        If (Session("pbakim_sil").ToString() = "1") Then

            Dim affected As Integer

            baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan.Open()
            cmd.Parameters.Clear()
            cmd.CommandText = "UPDATE ana_periyodik SET sil_durum = 1 WHERE pbakim_id = @pbakim_id AND firma_id = @firma_id"
            cmd.Parameters.AddWithValue("@pbakim_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("pbakim_id"))
            cmd.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
            cmd.Connection = baglan

            affected = cmd.ExecuteNonQuery()

            If affected > 0 Then
                varlikentrytxtbox.Text = ""
                verial()
            Else
                dosyakayitdeneme.Text = "İşlem başarız. Girilen verilerin tutarlılığından emin olunuz."
                dosyakayitdeneme.Visible = True
            End If

            baglan.Close()

        Else
            dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
            dosyakayitdeneme.Visible = True
        End If

    End Sub

    Protected Sub guncellebtn_Click(sender As Object, e As EventArgs)

        Try

            If (Session("pbakim_guncelle").ToString() = "1") Then


                Dim yeniDosyaAdi As String
                Dim dosyakayit As String
                Dim dosyaAdiSon As String


                If FileUpload3.HasFiles Then

                    Dim dosyayolu As String = Server.MapPath("~/periyodikDosyalar/")
                    Dim sessionDegeri As String = Session("firma").ToString() ' Session'dan değeri al
                    Dim labelDegeri As String = RandomIdOlustur() ' Label'ın Text parametresini al
                    yeniDosyaAdi = $"{sessionDegeri}_{labelDegeri}{Path.GetExtension(FileUpload3.FileName)}"

                    FileUpload3.SaveAs(Path.Combine(dosyayolu, yeniDosyaAdi))

                    'dosyakayitdeneme.Text = "Dosya Yolu: " & Path.Combine(dosyayolu, yeniDosyaAdi)
                    'dosyakayitdeneme.Text = yeniDosyaAdi
                    dosyakayit = Path.Combine(dosyayolu, yeniDosyaAdi)
                    dosyaAdiSon = "~/periyodikDosyalar/" + yeniDosyaAdi

                Else
                    'dosya seçilmediyse
                    dosyakayitdeneme.Text = "Dosya seçilmedi"
                End If

                Dim affected As Integer

                baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                baglan.Open()
                cmd.Parameters.Clear()
                cmd.CommandText = "UPDATE ana_periyodik SET pbakim_atanan_per = @pbakim_atanan_per, pbakim_varlik = @pbakim_varlik, pbakim_periyod = @pbakim_periyod, pbakim_basla_tarih = @pbakim_basla_tarih, pbakim_bitis_tarih = @pbakim_bitis_tarih, pbakim_durum = @pbakim_durum, pbakim_islem_durum = @pbakim_islem_durum, pbakim_dosya = @pbakim_dosya, pbakim_planli_tarih = @pbakim_planli_tarih, pbakim_aciklama = @pbakim_aciklama WHERE firma_id = @firma_id AND pbakim_id = @pbakim_id"
                cmd.Parameters.AddWithValue("@pbakim_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("pbakim_id"))
                cmd.Parameters.AddWithValue("@pbakim_atanan_per", guncellepersonelisim.Text)
                cmd.Parameters.AddWithValue("@pbakim_varlik", guncellevarlikselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_periyod", guncelleperiyodselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_basla_tarih", Convert.ToDateTime(guncellebaslatarih.Text))
                cmd.Parameters.AddWithValue("@pbakim_bitis_tarih", Convert.ToDateTime(guncellebitistarih.Text))
                cmd.Parameters.AddWithValue("@pbakim_durum", guncelledurumselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_islem_durum", guncelleislemdurumselect.SelectedValue)
                cmd.Parameters.AddWithValue("@pbakim_dosya", If(String.IsNullOrEmpty(dosyaAdiSon), "-", dosyaAdiSon))
                cmd.Parameters.AddWithValue("@pbakim_planli_tarih", Convert.ToDateTime(guncelleplantarihi.Text))
                cmd.Parameters.AddWithValue("@pbakim_aciklama", guncelleperiyodikaciklama.Text)
                cmd.Parameters.AddWithValue("@firma_id", Session("firmID"))

                cmd.Connection = baglan

                affected = cmd.ExecuteNonQuery()

                If affected > 0 Then
                    periyodikaciklamalentry.Text = ""
                    periyodikpersonelentry.Text = ""
                    verial()
                Else
                    dosyakayitdeneme.Text = "Kayıt işlemi esnasında hata oluştu. Lütfen girilen verileri kontrol edip tekrar deneyiniz."
                    dosyakayitdeneme.Visible = True
                End If

                baglan.Close()

            Else
                dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
                dosyakayitdeneme.Visible = True
            End If

        Catch ex As Exception

            dosyakayitdeneme.Text = "Kayıt işlemi esnasında hata oluştu. Lütfen girilen verileri kontrol edip tekrar deneyiniz."
            dosyakayitdeneme.Visible = True

        End Try

    End Sub

    Protected Sub pdfaktar_Click(sender As Object, e As EventArgs)
        gridExporter.WritePdfToResponse()
    End Sub

    Protected Sub excelaktar_Click(sender As Object, e As EventArgs)
        gridExporter.WriteXlsToResponse()
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