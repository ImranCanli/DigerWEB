Public Class DosyaGoster
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        aspimage.ImageUrl = Session("dosyaBurada").ToString()
    End Sub

End Class