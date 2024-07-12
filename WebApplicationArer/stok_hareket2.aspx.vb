Imports System.Data.SqlClient

Public Class stok_hareket2
    Inherits System.Web.UI.Page

    Dim baglan As New SqlConnection
    Dim cmd As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        verial()

    End Sub

    Protected Sub verial()

        SqlDataSource1.SelectCommand = ""

        SqlDataSource1.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource1.SelectCommand = "SELECT * FROM view_hareket WHERE sil_durum = 0 AND stok_id=" + Session("eladio").ToString() + "AND firma_id =" + Session("firmID").ToString()

    End Sub

    Protected Sub hareketsil_Click(sender As Object, e As EventArgs)

        Dim affected As Integer

        baglan.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        baglan.Open()
        cmd.Parameters.Clear()
        cmd.CommandText = "UPDATE stok_hareket SET sil_durum = 1 WHERE id = @id AND firma_id = @firma_id"
        cmd.Parameters.AddWithValue("@id", ASPxGridView1.GetDataRow(ASPxGridView1.FocusedRowIndex).Item("Expr3"))
        cmd.Parameters.AddWithValue("@firma_id", Session("firmID"))
        cmd.Connection = baglan

        affected = cmd.ExecuteNonQuery

        If affected > 0 Then
            verial()
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