Imports System.Data.SqlClient

Public Class Sayaclar
    Inherits System.Web.UI.Page

    Dim baglan As New SqlConnection
    Dim cmd As New SqlCommand
    Dim cmd2 As New SqlCommand
    Dim oku As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        verial()

    End Sub

    Protected Sub verial()


        SqlDataSource3.SelectCommand = ""
        SqlDataSource1.SelectCommand = ""
        SqlDataSource2.SelectCommand = ""

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM view_sayac WHERE sil_durum = 0 AND firma_id =" + Session("firmID").ToString()


        SqlDataSource2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource2.SelectCommand = "SELECT * FROM sayac_turler WHERE firma_id =" + Session("firmID").ToString()


        SqlDataSource3.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource3.SelectCommand = "SELECT * FROM varliklar1 WHERE firma_id =" + Session("firmID").ToString()

    End Sub
    Private Function RandomIdOlustur() As Integer
        Dim random As New Random()
        Return random.Next(100000, 999999)
    End Function
    Protected Sub sayac_ekle_Click(sender As Object, e As EventArgs)

        If (Session("sayac_ekle").ToString() = "1") Then

            Dim affected As Integer

            baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan.Open()
            cmd.Parameters.Clear()
            cmd.CommandText = "INSERT INTO bakim_sayac (sayac_tur, sayac_id, aciklama, atanan_per, varlik, birim, firma_id, sil_durum) VALUES (@sayac_tur, @sayac_id, @aciklama, @atanan_per, @varlik, @birim, @firma_id, @sil_durum)"
            cmd.Parameters.AddWithValue("@sayac_tur", sayacturentry.SelectedValue)
            cmd.Parameters.AddWithValue("@sayac_id", RandomIdOlustur())
            cmd.Parameters.AddWithValue("@aciklama", sayacaciklamaentry.Text)
            cmd.Parameters.AddWithValue("@atanan_per", sayacpersonentry.Text)
            cmd.Parameters.AddWithValue("@varlik", varlikentry.SelectedValue)
            cmd.Parameters.AddWithValue("@birim", birimentry.SelectedValue)
            cmd.Parameters.AddWithValue("@firma_id", Session("firmID"))
            cmd.Parameters.AddWithValue("@sil_durum", 0)
            cmd.Connection = baglan

            affected = cmd.ExecuteNonQuery

            If affected > 0 Then

                sayacaciklamaentry.Text = ""
                sayacpersonentry.Text = ""

                verial()
            Else
                uyarilabel.Text = "İşlem başarısız. Girilen verilerin tutarlılığından emin olunuz."
                uyarilabel.Visible = True
            End If

            baglan.Close()

        Else
            uyarilabel.Text = "Bu işlemi yapma yetkiniz yok"
            uyarilabel.Visible = True
        End If

    End Sub

    Protected Sub sayac_tur_sil_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "DELETE FROM sayac_turler WHERE id = @id AND firma_id = @firmID"
        cmd.Parameters.AddWithValue("@id", ASPxGridView2.GetDataRow(ASPxGridView2.FocusedRowIndex).Item("id"))
        cmd.Parameters.AddWithValue("@firmID", Session("firmID")) 'Session("firmID")
        cmd.Connection = baglan

        affected = cmd.ExecuteNonQuery
        If affected > 0 Then
            verial()
        End If
        baglan.Close()

    End Sub

    Protected Sub sayac_tur_ekle_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "INSERT INTO sayac_turler (tur_isim, tur_id, firma_id) VALUES (@tur_isim, @tur_id, @firma_id)"
        cmd.Parameters.AddWithValue("@tur_isim", Sayacisimentry.Text)
        cmd.Parameters.AddWithValue("@tur_id", RandomIdOlustur())
        cmd.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
        cmd.Connection = baglan

        affected = cmd.ExecuteNonQuery()

        If affected > 0 Then
            Sayacisimentry.Text = ""
            verial()
        End If

        baglan.Close()

    End Sub

    Protected Sub varlik_sil_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "DELETE FROM varliklar1 WHERE id = @id AND firma_id = @firmID"
        cmd.Parameters.AddWithValue("@id", ASPxGridView2.GetDataRow(ASPxGridView2.FocusedRowIndex).Item("id"))
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

    Protected Sub sayac_sil_Click(sender As Object, e As EventArgs)

        If (Session("sayac_sil").ToString() = "1") Then

            Dim affected As Integer

            baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan.Open()
            cmd.Parameters.Clear()
            cmd.CommandText = "UPDATE bakim_sayac SET sil_durum = 1 WHERE sayac_id = @sayac_id AND firma_id = @firma_id"
            cmd.Parameters.AddWithValue("@sayac_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("sayac_id"))
            cmd.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
            cmd.Connection = baglan

            affected = cmd.ExecuteNonQuery()

            If affected > 0 Then
                verial()
            Else
                sayacsiluyarilabel.Visible = True
            End If

            baglan.Close()

        Else
            sayacsiluyarilabel.Text = "Bu işlemi yapma yetkiniz yok"
            sayacsiluyarilabel.Visible = True
        End If

    End Sub

    Protected Sub sayac_oku_ekle_Click(sender As Object, e As EventArgs)

        Try

            If (Session("sayac_islem_gir").ToString() = "1") Then


                Dim tarihformat As DateTime = sayacokudate.Text
                Dim gelentarih As String = tarihformat.ToString("yyyyy-MM-dd")

                Dim affected As Integer
                Dim subaffected As Integer

                baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                baglan.Open()
                cmd.Parameters.Clear()
                cmd.CommandText = "INSERT INTO sayac_okumalar (oku_tarih, oku_birim, oku_deger, firma_id, ana_sayac_id, sil_durum1) VALUES (@oku_tarih, @oku_birim, @oku_deger, @firma_id, @ana_sayac_id, 0)"
                cmd.Parameters.AddWithValue("@ana_sayac_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("sayac_id"))
                cmd.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
                cmd.Parameters.AddWithValue("@oku_tarih", Convert.ToDateTime(gelentarih))
                cmd.Parameters.AddWithValue("@oku_birim", sayac_oku_birim_entry.Text)
                cmd.Parameters.AddWithValue("@oku_deger", sayac_oku_deger_entry.Text)
                cmd.Connection = baglan

                affected = cmd.ExecuteNonQuery()

                If affected > 0 Then

                    cmd2.Parameters.Clear()
                    cmd2.CommandText = "UPDATE bakim_sayac SET onceki_deger = son_okunan, onceki_tarih = son_tarih, son_okunan = @son_okunan, son_tarih = @son_tarih WHERE firma_id = @firma_id AND sayac_id = @sayac_id"
                    cmd2.Parameters.AddWithValue("@sayac_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("sayac_id"))
                    cmd2.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
                    cmd2.Parameters.AddWithValue("@son_okunan", sayac_oku_deger_entry.Text)
                    cmd2.Parameters.AddWithValue("@son_tarih", Convert.ToDateTime(gelentarih))
                    cmd2.Connection = baglan

                    subaffected = cmd2.ExecuteNonQuery()

                    If subaffected > 0 Then

                        sayac_oku_deger_entry.Text = ""
                        verial()
                    Else
                        dosyakayitdeneme.Text = "Veriler kaydedilirken hata oluştu."
                        dosyakayitdeneme.Visible = True
                    End If

                End If

                baglan.Close()


            Else

                dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
                dosyakayitdeneme.Visible = True
            End If

        Catch ex As Exception
            dosyakayitdeneme.Text = "Veriler kaydedilirken hata oluştu. Hata ;" + ex.Message
        End Try



    End Sub

    Protected Sub sayacguncellebuton_Click(sender As Object, e As EventArgs)


        If (Session("sayac_guncelle").ToString() = "1") Then

            Dim affected As Integer

            baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
            baglan.Open()
            cmd.Parameters.Clear()
            cmd.CommandText = "UPDATE bakim_sayac SET aciklama = @aciklama, atanan_per = @atanan_per, varlik = @varlik, birim = @birim, sayac_tur = @sayactur WHERE firma_id = @firma_id AND sayac_id = @sayac_id"
            cmd.Parameters.AddWithValue("@sayac_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("sayac_id"))
            cmd.Parameters.AddWithValue("@firma_id", Session("firmID")) 'Session("firmID")
            cmd.Parameters.AddWithValue("@aciklama", If(String.IsNullOrEmpty(guncelsayacaciklamaentry.Text), DBNull.Value, guncelsayacaciklamaentry.Text))
            cmd.Parameters.AddWithValue("@atanan_per", If(String.IsNullOrEmpty(guncelsayacpersonelentry.Text), DBNull.Value, guncelsayacpersonelentry.Text))
            cmd.Parameters.AddWithValue("@varlik", guncelvarlikselect.SelectedValue)
            cmd.Parameters.AddWithValue("@birim", guncelbirimselect.SelectedValue)
            cmd.Parameters.AddWithValue("@sayac_tur", guncelsayacturselect.SelectedValue)
            cmd.Connection = baglan

            affected = cmd.ExecuteNonQuery()

            If affected > 0 Then
                guncelsayacpersonelentry.Text = ""
                guncelsayacaciklamaentry.Text = ""
                verial()
            Else
                dosyakayitdeneme.Text = "İşlem başarısız. Girilen verilerin tutarlılığından emin olunuz"
                dosyakayitdeneme.Visible = True
            End If

            baglan.Close()

        Else
            dosyakayitdeneme.Text = "Bu işlemi yapma yetkiniz yok"
            dosyakayitdeneme.Visible = True

        End If


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