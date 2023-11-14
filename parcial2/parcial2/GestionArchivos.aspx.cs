using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial2
{
    public partial class GestionArchivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (this.Session["usuario"] != null)
            {
                this.usuarioTB.Text = this.Session["usuario"].ToString();
            }
            if (this.IsPostBack == false)
            {
                if (this.Request.Cookies["pass"] != null)
                {
                    this.contraseñaTB.Text = this.Request.Cookies["pass"].Value;
                }
            }
        }

        //Carpeta y Archivos
        public void controlCarpeta(string carpeta)
        {
            if (!Directory.Exists(carpeta))
            {
                Directory.CreateDirectory(carpeta);
            }            
        }
        public void cargarArchivos(string carpeta)
        {
            if (Directory.Exists(carpeta))
            {
                string[] files = Directory.GetFiles(carpeta);
                List<Archivo> fileList = new List<Archivo>();
                foreach (string file in files)
                {
                    var fileNew = new Archivo(Path.GetFileName(file), file);
                    fileList.Add(fileNew);
                }
                listaArchivosGV.DataSource = fileList;
                listaArchivosGV.DataBind();
            }
        }

        //Buscar Archivos
        protected void buscarBT_Click(object sender, EventArgs e)
        {
            if (usuarioTB.Text != "" && contraseñaTB.Text != "")
            {
                buscarLB.Text = "-";
                string carpeta = $"{Server.MapPath(".")}/{usuarioTB.Text}";
                controlCarpeta(carpeta);
                cargarArchivos(carpeta);
            }
            else
            {
                buscarLB.Text = "Faltan Datos";
            }
        }
        //Guardar Archivo
        protected void guardarBT_Click(object sender, EventArgs e)
        {
            if (usuarioTB.Text != "" && contraseñaTB.Text != "")
            {
                if (FileUpload1.FileName != "")
                {
                    guardarLB.Text = "-";
                    string carpeta = $"{Server.MapPath(".")}/{usuarioTB.Text}";
                    controlCarpeta(carpeta);

                    if (File.Exists($"{carpeta}/{this.FileUpload1.FileName}"))
                    {
                        this.guardarLB.Text = "Existe un archivo con dicho nombre en el servidor";
                    }
                    else
                    {
                        this.FileUpload1.SaveAs($"{carpeta}/{this.FileUpload1.FileName}");

                        this.guardarLB.Text = "Archivo subido";
                        cargarArchivos(carpeta);
                    }
                }
                else
                {
                    this.guardarLB.Text = "Falta buscar el archivo";
                }
            }
            else
            {
                guardarLB.Text = "Faltan Datos de Usuario";
            }
        }

        //Botones GridView
        protected void listaArchivosGV_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "descargar")
            {
                GridViewRow registro = listaArchivosGV.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[3].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
            if (e.CommandName == "eliminar")
            {
                GridViewRow registro = listaArchivosGV.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[3].Text;
                File.Delete(filePath);

                string carpeta = $"{Server.MapPath(".")}/{usuarioTB.Text}";
                cargarArchivos(carpeta);
            }
        }
    }
}