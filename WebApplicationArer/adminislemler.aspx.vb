Imports System.Data.SqlClient

Public Class adminislemler
    Inherits System.Web.UI.Page

    Dim baglanti As New SqlConnection
    Dim komut As New SqlCommand
    Dim okuyucu As SqlDataReader

    Dim connectionstringG As String = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim firstquery As String = "SELECT * FROM bakim_login WHERE firm_id =" + Session("firmID").ToString()
        verial(firstquery)
    End Sub

    Protected Sub verial(queryuse As String)
        Dim connectionString As String = connectionstringG

        Using connection As New SqlConnection(connectionString)
            Dim query As String = queryuse

            Using command As New SqlCommand(query, connection)
                connection.Open()

                Dim reader As SqlDataReader = command.ExecuteReader()

                Dim dataTable As New DataTable()

                dataTable.Load(reader)

                connection.Close()

                Repeater1.DataSource = dataTable
                Repeater1.DataBind()
            End Using
        End Using
    End Sub

    Private Function RandomIdOlustur() As Integer
        Dim random As New Random()
        Return random.Next(100000, 999999)
    End Function

    Protected Sub butonkaydet_Click(sender As Object, e As EventArgs)

        Dim affected As Integer
        Dim queryagain As String = "SELECT * FROM bakim_login WHERE firm_id =" + Session("firmID").ToString()

        baglanti.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglanti.Open()
        komut.Parameters.Clear()
        komut.CommandText = "UPDATE bakim_login SET yetki = @yetki, ariza_ekle = @ariza_ekle, ariza_sil = @ariza_sil, ariza_sonuclandir = @ariza_sonuclandir, stok_kart_ekle = @stok_kart_ekle, stok_giris_yap = @stok_giris_yap, stok_cikis_yap = @stok_cikis_yap, sayac_ekle = @sayac_ekle, sayac_sil = @sayac_sil, sayac_islem_gir = @sayac_islem_gir, sayac_guncelle = @sayac_guncelle, ariza_guncelle = @ariza_guncelle, pbakim_ekle = @pbakim_ekle, pbakim_sil = @pbakim_sil, pbakim_guncelle = @pbakim_guncelle WHERE id = @id AND firm_id =" + Session("firmID").ToString()
        komut.Parameters.AddWithValue("@id", duzenlenenitemId.Value)
        komut.Parameters.AddWithValue("@yetki", adminyetkisivarmi.Value)
        komut.Parameters.AddWithValue("@ariza_ekle", arizaeklemevarmi.Value)
        komut.Parameters.AddWithValue("@ariza_sil", arizasilmevarmi.Value)
        komut.Parameters.AddWithValue("@ariza_sonuclandir", ariasonuclandirmavarmi.Value)
        komut.Parameters.AddWithValue("@stok_kart_ekle", stokkartieklemevarmi.Value)
        komut.Parameters.AddWithValue("@stok_giris_yap", stokgirisiyapmavarmi.Value)
        komut.Parameters.AddWithValue("@stok_cikis_yap", stokcikisiyapmavarmi.Value)
        komut.Parameters.AddWithValue("@sayac_ekle", sayaceklemevarmi.Value)
        komut.Parameters.AddWithValue("@sayac_sil", sayacsilmevarmi.Value)
        komut.Parameters.AddWithValue("@sayac_islem_gir", sayacislemgirmevarmi.Value)
        komut.Parameters.AddWithValue("@sayac_guncelle", sayacguncellemevarmi.Value)
        komut.Parameters.AddWithValue("@ariza_guncelle", arizaguncellemevarmi.Value)
        komut.Parameters.AddWithValue("@pbakim_ekle", periyodikbakimeklemevarmi.Value)
        komut.Parameters.AddWithValue("@pbakim_sil", periyodikbakimsilmevarmi.Value)
        komut.Parameters.AddWithValue("@pbakim_guncelle", periyodikbakimguncellemevarmi.Value)

        komut.Connection = baglanti
        affected = komut.ExecuteNonQuery()

        If (affected > 0) Then
            verial(queryagain)
        End If

        baglanti.Close()
    End Sub

    Protected Sub kulaniciekleBtn_Click(sender As Object, e As EventArgs)

        Dim affected As Integer
        Dim queryagain As String = "SELECT * FROM bakim_login WHERE firm_id =" + Session("firmID").ToString()
        baglanti.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglanti.Open()
        komut.Parameters.Clear()
        komut.CommandText = "INSERT INTO bakim_login (id, ad, firma_bilgi, kadi, parola, sqlip, username, user_parola, firm_id, yetki, ariza_ekle, ariza_sil, ariza_sonuclandir, stok_kart_ekle, stok_giris_yap, stok_cikis_yap, sayac_ekle, sayac_sil, sayac_islem_gir, sayac_guncelle, ariza_guncelle, pbakim_ekle, pbakim_sil, pbakim_guncelle) VALUES (@id, @ad, @firma_bilgi, @kadi, @parola, @sqlip, @username, @user_parola, @firm_id, @yetki, @ariza_ekle, @ariza_sil, @ariza_sonuclandir, @stok_kart_ekle, @stok_giris_yap, @stok_cikis_yap, @sayac_ekle, @sayac_sil, @sayac_islem_gir, @sayac_guncelle, @ariza_guncelle, @pbakim_ekle, @pbakim_sil, @pbakim_guncelle)"
        komut.Parameters.AddWithValue("@ad", kullaniciismientry.Text)
        komut.Parameters.AddWithValue("@id", RandomIdOlustur())
        komut.Parameters.AddWithValue("@firma_bilgi", "ARER") 'BURAYI DÜZENLE !!!!
        komut.Parameters.AddWithValue("@kadi", kullaniciadientry.Text)
        komut.Parameters.AddWithValue("@parola", kullanicisifreentry.Text)
        komut.Parameters.AddWithValue("@sqlip", "85.98.41.41,1433") 'BURAYI DÜZENLE !!!!
        komut.Parameters.AddWithValue("@username", "sa") 'BURAYI DÜZENLE !!!!
        komut.Parameters.AddWithValue("@user_parola", 1453) 'BURAYI DÜZENLE !!!!
        komut.Parameters.AddWithValue("@firm_id", Session("firmID").ToString())
        komut.Parameters.AddWithValue("@yetki", 0)
        komut.Parameters.AddWithValue("@ariza_ekle", 0)
        komut.Parameters.AddWithValue("@ariza_sil", 0)
        komut.Parameters.AddWithValue("@ariza_sonuclandir", 0)
        komut.Parameters.AddWithValue("@stok_kart_ekle", 0)
        komut.Parameters.AddWithValue("@stok_giris_yap", 0)
        komut.Parameters.AddWithValue("@stok_cikis_yap", 0)
        komut.Parameters.AddWithValue("@sayac_ekle", 0)
        komut.Parameters.AddWithValue("@sayac_sil", 0)
        komut.Parameters.AddWithValue("@sayac_islem_gir", 0)
        komut.Parameters.AddWithValue("@sayac_guncelle", 0)
        komut.Parameters.AddWithValue("@ariza_guncelle", 0)
        komut.Parameters.AddWithValue("@pbakim_ekle", 0)
        komut.Parameters.AddWithValue("@pbakim_sil", 0)
        komut.Parameters.AddWithValue("@pbakim_guncelle", 0)

        komut.Connection = baglanti
        affected = komut.ExecuteNonQuery()

        If (affected > 0) Then
            verial(queryagain)
        End If

        baglanti.Close()
    End Sub

    Protected Sub silbuton_Click(sender As Object, e As EventArgs)
        Dim affected As Integer
        Dim queryagain = "SELECT * FROM bakim_login WHERE firm_id =" + Session("firmID").ToString()
        baglanti.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglanti.Open()
        komut.Parameters.Clear()
        komut.CommandText = "DELETE FROM bakim_login WHERE id = @id AND firm_id =" + Session("firmID").ToString()
        komut.Parameters.AddWithValue("@id", duzenlenenitemId.Value)
        komut.Connection = baglanti

        affected = komut.ExecuteNonQuery()

        If (affected > 0) Then
            verial(queryagain)
        End If

        baglanti.Close()
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