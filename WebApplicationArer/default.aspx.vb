Imports System.Data.SqlClient
Imports System.IO
Imports DevExpress.Web
Imports DevExpress.XtraRichEdit.Commands.Internal


Public Class _default
    Inherits System.Web.UI.Page

    Dim baglan As New SqlConnection
    Dim cmd As New SqlCommand
    Dim read As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not String.IsNullOrEmpty(Request.QueryString("kadi")) AndAlso Not String.IsNullOrEmpty(Request.QueryString("parola")) Then
            baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=********;Password=*******"
            baglan.Open()
            cmd.Parameters.Clear()
            cmd.CommandText = "SELECT kadi, parola, firma_bilgi, firm_id FROM login_yeni WHERE kadi = @kadi AND parola = @parola"
            cmd.Parameters.AddWithValue("@kadi", Request.QueryString("kadi"))
            cmd.Parameters.AddWithValue("@parola", Request.QueryString("parola"))
            read = cmd.ExecuteReader

            If read.Read Then

                Session("kadi") = read("kadi")
                Session("parola") = read("parola")
                Session("firma") = read("firma_bilgi")
                Session("firmID") = read("firm_id")

                Response.Redirect("anasayfa.aspx")
            End If
            baglan.Close()
        End If

    End Sub

    Protected Sub gobutton_Click(sender As Object, e As EventArgs)


        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=******;User ID=*******;Password=*******"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "SELECT * FROM bakim_login WHERE kadi = @kadi AND parola = @parola"
        cmd.Parameters.AddWithValue("@kadi", kullaniciadientry.Text)
        cmd.Parameters.AddWithValue("@parola", sifreentry.Text)
        cmd.Connection = baglan

        read = cmd.ExecuteReader

        If read.Read Then
            Session("kadi") = read("kadi")
            Session("parola") = read("parola")
            Session("firma_bilgi") = read("firma_bilgi")
            Session("firmID") = read("firm_id")
            Session("id") = read("id")
            Session("ad") = read("ad")
            Session("yetki") = read("yetki")
            Session("ariza_ekle") = read("ariza_ekle")
            Session("ariza_sil") = read("ariza_sil")
            Session("ariza_sonuclandir") = read("ariza_sonuclandir")
            Session("stok_kart_ekle") = read("stok_kart_ekle")
            Session("stok_giris_yap") = read("stok_giris_yap")
            Session("stok_cikis_yap") = read("stok_cikis_yap")
            Session("sayac_ekle") = read("sayac_ekle")
            Session("sayac_sil") = read("sayac_sil")
            Session("sayac_islem_gir") = read("sayac_islem_gir")
            Session("sayac_guncelle") = read("sayac_guncelle")
            Session("ariza_guncelle") = read("ariza_guncelle")
            Session("pbakim_ekle") = read("pbakim_ekle")
            Session("pbakim_sil") = read("pbakim_sil")
            Session("pbakim_guncelle") = read("pbakim_guncelle")

            Response.Redirect("anasayfa.aspx")
        End If

        baglan.Close()

        'baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        'baglan.Open()
        'cmd.Parameters.Clear()
        'cmd.CommandText = "SELECT kadi, parola, firma_bilgi, firm_id FROM login_yeni WHERE kadi = @kadi AND parola = @parola"
        'cmd.Parameters.AddWithValue("@kadi", kullaniciadientry.Text)
        'cmd.Parameters.AddWithValue("@parola", sifreentry.Text)
        'cmd.Connection = baglan

        'read = cmd.ExecuteReader

        'If read.Read Then
        '    Session("kadi") = read("kadi")
        '    Session("parola") = read("parola")
        '    Session("firma") = read("firma_bilgi")
        '    Session("firmID") = read("firm_id")

        '    Response.Redirect("anasayfa.aspx")
        'End If

    End Sub

End Class