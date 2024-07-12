Public Class ArizaMalzemeler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource4.ConnectionString = "Data Source=******;Network Library=DBMSSOCN;Initial Catalog=*******;User ID=*******;Password=********"
        SqlDataSource4.SelectCommand = "SELECT * FROM stok_hareket WHERE firma_id =" + Session("firmID").ToString() + "AND bakim_id =" + Session("eladio2").ToString()

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