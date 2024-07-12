Imports System.Data.SqlClient

Public Class Stok
    Inherits System.Web.UI.Page

    Dim baglan2 As New SqlConnection
    Dim cmd2 As New SqlCommand
    Dim oku2 As SqlDataReader

    Dim baglan3 As New SqlConnection
    Dim cmd3 As New SqlCommand
    Dim oku3 As SqlDataReader

    Dim baglan5 As New SqlConnection
    Dim cmd5 As New SqlCommand
    Dim oku5 As SqlDataReader

    Dim baglan4 As New SqlConnection
    Dim cmd4 As New SqlCommand
    Dim oku4 As SqlDataReader

    Dim subBaglan As New SqlConnection
    Dim subCmd As New SqlCommand
    Dim subReader As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        verial()
        'baglan2.ConnectionString = "Data Source=85.98.41.81;Initial catalog=bakim_onarim;User ID=sa;Password=1453;"
        'baglan2.Open()
        'cmd2.Parameters.Clear()
        'cmd2.CommandText = "SELECT giren, cikan FROM view_stok_ana2 WHERE id = @id"
        'cmd2.Parameters.AddWithValue("@id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
        'cmd2.Connection = baglan2
        'oku2 = cmd2.ExecuteReader()

        'If oku2.Read Then
        '    girenstoklabel.Text = oku2("giren").ToString()
        '    cikanstoklabel.Text = oku2("cikan").ToString()
        'Else
        '    girenstoklabel.Text = "-"
        '    cikanstoklabel.Text = "-"
        'End If
    End Sub

    Protected Sub verial()

        SqlDataSource1.SelectCommand = ""
        'SqlDataSource2.SelectCommand = ""
        SqlDataSourceForBakim.SelectCommand = ""

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM view_stok_ana4 WHERE firma_id =" + Session("firmID").ToString()

        SqlDataSourceForBakim.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSourceForBakim.SelectCommand = "SELECT * FROM master_bakim WHERE sil_durum1 = 0 AND sonuc = 'Sonuçlanmadı' AND firma_id=" + Session("firmID").ToString()

        'SqlDataSource2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        'SqlDataSource2.SelectCommand = "SELECT * FROM stok_master"
    End Sub

    Private Function RandomIdOlustur() As Integer
        Dim random As New Random()
        Return random.Next(100000, 999999)
    End Function

    'Private Sub ASPxGridView1_FocusedRowChanged(sender As Object, e As EventArgs) Handles ASPxGridView1.FocusedRowChanged

    '    If ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex) IsNot Nothing Then

    '        Session("secilen_urun_id") = ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id")
    '    Else
    '        'Session("secilen_urun_id") = 1
    '    End If
    'End Sub

    'Protected Sub stoksil_Click(sender As Object, e As EventArgs)

    '    Dim varmi As Integer
    '    Dim affecteds As Integer
    '    Dim affecteds2 As Integer
    '    Dim affecteds3 As Integer
    '    Dim affecteds4 As Integer


    '    baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
    '    baglan.Open()
    '    cmd.Parameters.Clear()
    '    cmd.CommandText = "SELECT * FROM stok_master WHERE id = @stok_id"
    '    cmd.Parameters.AddWithValue("@stok_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
    '    cmd.Connection = baglan
    '    oku = cmd.ExecuteReader()

    '    If oku.Read Then
    '        varmi = oku("fiili_adet")
    '    Else
    '        varmi = 0
    '    End If
    '    baglan.Close()

    '    If varmi > 0 Then
    '        baglan4.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
    '        baglan4.Open()
    '        cmd4.Parameters.Clear()
    '        cmd4.CommandText = "UPDATE stok_master SET fiili_adet = fiili_adet - 1 WHERE id = @stok_id"
    '        cmd4.Parameters.AddWithValue("@stok_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
    '        cmd4.Connection = baglan4
    '        affecteds = cmd4.ExecuteNonQuery()

    '        If affecteds > 0 Then
    '            cmd4.Parameters.Clear()
    '            cmd4.CommandText = "INSERT INTO stok_hareket (stok_id, tarih, adet, hareket_turu, mak_kod, isletme_tur, islem_yapan, bakim_id, personel) VALUES (@stok_id, @tarih, 1, ÇIKIŞ, 1001, ÖRGÜ, İMRAN, 0, İMRAN)"
    '            cmd4.Parameters.AddWithValue("@stok_id", Session("secilen_urun_id"))
    '            cmd4.Parameters.AddWithValue("@tarih", DateTime.Now)
    '            cmd4.Connection = baglan4

    '            affecteds2 = cmd4.ExecuteNonQuery()

    '        End If
    '    ElseIf varmi = 1 Then

    '        cmd.Parameters.Clear()
    '        cmd4.CommandText = "DELETE FROM stok_master WHERE id = @stok_id"
    '        cmd4.Parameters.AddWithValue("@stok_id", Session("secilen_urun_id"))
    '        cmd.Connection = baglan4

    '        affecteds3 = cmd4.ExecuteNonQuery()

    '        If affecteds3 > 0 Then
    '            cmd4.Parameters.Clear()
    '            cmd4.CommandText = "INSERT INTO stok_hareket (stok_id, tarih, adet, hareket_turu, mak_kod, isletme_tur, islem_yapan, bakim_id, personel) VALUES (@stok_id, @tarih, 1, ÇIKIŞ, 1001, ÖRGÜ, İMRAN, 0, İMRAN)"
    '            cmd4.Parameters.AddWithValue("@stok_id", Session("secilen_urun_id"))
    '            cmd4.Parameters.AddWithValue("@tarih", DateTime.Now)
    '            cmd4.Connection = baglan4

    '            affecteds4 = cmd4.ExecuteNonQuery()
    '        End If
    '    End If

    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

        Try

            If (Session("stok_kart_ekle").ToString() = "1") Then

                Dim tarihformat As DateTime = txtStockDate.Text
                Dim gelentarih As String = tarihformat.ToString("yyyyy-MM-dd")

                Dim affectedrows As Integer

                baglan3.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                baglan3.Open()
                cmd3.Parameters.Clear()
                cmd3.CommandText = "INSERT INTO stok_master (tarih, stok_kodu, stok_adi, mensei, tur, isletme_tur, barkod_no, birim, firma_id) VALUES (@tarih, @stok_kod, @stok_ad, @mensei, @tur, @isletme_turu, @barkod_no, @birim, @firma_id)"
                cmd3.Parameters.AddWithValue("@tarih", Convert.ToDateTime(gelentarih))
                cmd3.Parameters.AddWithValue("@stok_kod", stokkodentry.Text)
                cmd3.Parameters.AddWithValue("@stok_ad", stokadentry.Text)
                cmd3.Parameters.AddWithValue("@mensei", menseientry.Text)
                'cmd3.Parameters.AddWithValue("@ekleyen", ekleyenentry.Text)
                cmd3.Parameters.AddWithValue("@tur", turentry.Text)
                cmd3.Parameters.AddWithValue("@isletme_turu", isletmeturuentry.Text)
                cmd3.Parameters.AddWithValue("@barkod_no", barkodnoentry.Text)
                cmd3.Parameters.AddWithValue("@birim", BirimTurEntry.SelectedValue)
                cmd3.Parameters.AddWithValue("@firma_id", Session("firmID"))
                cmd3.Connection = baglan3
                affectedrows = cmd3.ExecuteNonQuery()

                If affectedrows = 1 Then

                    verial()
                Else
                    uyarilabel.Visible = True
                End If
                baglan3.Close()

            Else
                uyarilabel.Text = "Bu işlemi yapma yetkiniz yok"
            End If

        Catch ex As Exception
            uyarilabel.Text = "Girilen verilerin tutarlılığından emin olunuz."
            uyarilabel.Visible = True
        End Try

    End Sub

    Protected Sub Stokcikar_Click(sender As Object, e As EventArgs)

        Try

            If (Session("stok_cikis_yap").ToString() = "1") Then


                Dim etki As Integer
                Dim mevcut As Integer

                Dim tarihformat1 As DateTime = TextBox1.Text
                Dim gelentarih1 As String = tarihformat1.ToString("yyyyy-MM-dd")

                subBaglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                subBaglan.Open()
                subCmd.CommandText = "SELECT guncel_adet FROM view_stok_ana4 WHERE id = @stok_id1 AND firma_id =" + Session("firmID").ToString()
                subCmd.Parameters.AddWithValue("@stok_id1", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
                subCmd.Connection = subBaglan
                subReader = subCmd.ExecuteReader

                If subReader.Read Then
                    mevcut = Convert.ToInt32(subReader("guncel_adet"))
                End If

                If (mevcut > 0) AndAlso (mevcut > Convert.ToInt32(TextBox2.Text)) Then

                    baglan2.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                    baglan2.Open()
                    cmd2.Parameters.Clear()
                    cmd2.CommandText = "INSERT INTO stok_hareket (stok_id, tarih, tur, adet, hareket_turu, mak_kod, isletme_tur, islem_yapan, bakim_id, firma_id) VALUES (@stok_id, @tarih, @tur, @adet, 'ÇIKIŞ', @mak_kod, @isletme_tur, @islem_yapan, @bakim_id, @firma_id)"
                    cmd2.Parameters.AddWithValue("@tarih", Convert.ToDateTime(gelentarih1))
                    cmd2.Parameters.AddWithValue("@stok_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
                    cmd2.Parameters.AddWithValue("@tur", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("tur"))
                    cmd2.Parameters.AddWithValue("@adet", TextBox2.Text)
                    cmd2.Parameters.AddWithValue("@mak_kod", ASPxGridView2.GetDataRow(ASPxGridView2.FocusedRowIndex).Item("makkod"))
                    cmd2.Parameters.AddWithValue("@isletme_tur", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("isletme_tur"))
                    cmd2.Parameters.AddWithValue("@islem_yapan", TextBox4.Text)
                    cmd2.Parameters.AddWithValue("@bakim_id", ASPxGridView2.GetDataRow(ASPxGridView2.FocusedRowIndex).Item("ariza_id"))
                    cmd2.Parameters.AddWithValue("@firma_id", Session("firmID"))
                    cmd2.Connection = baglan2

                    etki = cmd2.ExecuteNonQuery()

                    If etki > 0 Then

                        TextBox1.Text = ""
                        TextBox2.Text = ""
                        TextBox3.Text = ""
                        TextBox4.Text = ""
                        Label2.Text = ""
                        TextBox5.Text = ""

                        verial()

                    Else
                        Label2.Text = "Lütfen girilen verilerin tutarlılığından emin olunuz."
                        Label2.Visible = True
                    End If

                Else
                    Label2.Text = "Çıkarmak istediğiniz ürünün varolduğundan ve ya adetinin yeterli olduğundan emin olunuz."
                    Label2.Visible = True
                End If


            Else
                Label2.Text = "Bu işlemi yapma yetkiniz yok"
                Label2.Visible = True
            End If

        Catch ex As Exception
            Label2.Text = "Lütfen girilen verilerin tutarlılığından emin olunuz."
            Label2.Visible = True
        End Try
        subBaglan.Close()
        baglan2.Close()

    End Sub

    Protected Sub StokEkle_Click(sender As Object, e As EventArgs)

        Try

            If (Session("stok_giris_yap").ToString() = "1") Then

                Dim tarihformat2 As DateTime = harekettarih.Text
                Dim gelentarih2 As String = tarihformat2.ToString("yyyyy-MM-dd")

                If iadevecikis.SelectedValue = "GİRİŞ" Then

                    Dim etki1 As Integer

                    baglan5.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                    baglan5.Open()
                    cmd5.Parameters.Clear()
                    cmd5.CommandText = "INSERT INTO stok_hareket (stok_id, tarih, tur, adet, hareket_turu, isletme_tur, islem_yapan, firma_id) VALUES (@stok_id, @tarih, @tur, @adet, 'GİRİŞ', @isletme_tur, @islem_yapan, @firma_id)"
                    cmd5.Parameters.AddWithValue("@tarih", Convert.ToDateTime(gelentarih2))
                    cmd5.Parameters.AddWithValue("@stok_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
                    cmd5.Parameters.AddWithValue("@tur", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("tur"))
                    cmd5.Parameters.AddWithValue("@adet", hareketadet.Text)
                    'cmd5.Parameters.AddWithValue("@mak_kod", hareketmakkod.Text)
                    cmd5.Parameters.AddWithValue("@isletme_tur", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("isletme_tur"))
                    cmd5.Parameters.AddWithValue("@islem_yapan", harekenyapan.Text)
                    cmd5.Parameters.AddWithValue("@firma_id", Session("firmID"))
                    'cmd5.Parameters.AddWithValue("@bakim_id", hareketbakim.Text)
                    cmd5.Connection = baglan5

                    etki1 = cmd5.ExecuteNonQuery()

                    If etki1 > 0 Then

                        harekettarih.Text = ""
                        hareketadet.Text = ""
                        hareketadet.Text = ""
                        hareketmakkod.Text = ""
                        harekenyapan.Text = ""
                        hareketbakim.Text = ""
                        Label1.Text = ""

                        verial()
                    Else
                        Label1.Text = "Lütfen girilen verilerin tutarlılığından emin olunuz"
                        Label1.Visible = True
                    End If
                    baglan5.Close()

                ElseIf iadevecikis.SelectedValue = "İADE" Then

                    Dim etki3 As Integer

                    baglan4.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
                    baglan4.Open()
                    cmd4.Parameters.Clear()
                    cmd4.CommandText = "INSERT INTO stok_hareket (stok_id, tarih, tur, adet, hareket_turu, isletme_tur, islem_yapan, firma_id) VALUES (@stok_id, @tarih, @tur, @adet, 'İADE', @isletme_tur, @islem_yapan, @firma_id)"
                    cmd4.Parameters.AddWithValue("@tarih", Convert.ToDateTime(gelentarih2))
                    cmd4.Parameters.AddWithValue("@stok_id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id"))
                    cmd4.Parameters.AddWithValue("@tur", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("tur"))
                    cmd4.Parameters.AddWithValue("@adet", hareketadet.Text)
                    'cmd4.Parameters.AddWithValue("@mak_kod", TextBox8.Text)
                    cmd4.Parameters.AddWithValue("@isletme_tur", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("isletme_tur"))
                    cmd4.Parameters.AddWithValue("@islem_yapan", harekenyapan.Text)
                    cmd4.Parameters.AddWithValue("@firma_id", Session("firmID"))
                    'cmd4.Parameters.AddWithValue("@bakim_id", hareketbakim.Text)
                    cmd4.Connection = baglan4

                    etki3 = cmd4.ExecuteNonQuery()

                    If etki3 > 0 Then

                        harekettarih.Text = ""
                        hareketadet.Text = ""
                        hareketadet.Text = ""
                        hareketmakkod.Text = ""
                        harekenyapan.Text = ""
                        hareketbakim.Text = ""
                        Label1.Text = ""

                        verial()
                    Else
                        Label1.Text = "Lütfen girilen verilerin tutarlılığından emin olunuz"
                        Label1.Visible = True
                    End If
                    baglan4.Close()

                End If

            Else
                Label1.Text = "Bu işlemi yapma yetkiniz yok"
                Label1.Visible = True
            End If

        Catch ex As Exception
            Label1.Text = "Lütfen girilen verilerin tutarlılığından emin olunuz"
            Label1.Visible = True
        End Try

    End Sub

    Protected Sub StokIade_Click(sender As Object, e As EventArgs)

        Try


        Catch ex As Exception

            Label3.Text = "Lütfen girilen verilerin tutarlılığından emin olunuz"
            Label3.Visible = True

        End Try


    End Sub

    Private Sub ASPxGridView1_FocusedRowChanged(sender As Object, e As EventArgs) Handles ASPxGridView1.FocusedRowChanged

        If ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex) IsNot Nothing Then
            Session("eladio") = ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("id")
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
