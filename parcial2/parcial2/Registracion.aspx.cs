using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial2
{
    public partial class Registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        //Boton Registrar
        protected void registrarBT_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                resultadoLB.Text = "Usuario Registrado." + " - ";

                HttpCookie cookie1 = new HttpCookie("pass", this.contraseña1TB.Text);
                this.Response.Cookies.Add(cookie1);

                resultadoLB.Text += "Cookie (pass): " + contraseña1TB.Text + " - ";

                this.Session["usuario"] = this.usuarioTB.Text;

                resultadoLB.Text += "Session (usuario): " + usuarioTB.Text;
            }
        }
    }
}