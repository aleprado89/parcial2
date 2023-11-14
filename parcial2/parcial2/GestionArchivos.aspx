<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="GestionArchivos.aspx.cs" Inherits="parcial2.GestionArchivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Usuario:"></asp:Label>
    <br />
    <asp:TextBox ID="usuarioTB" runat="server" Width="230px" Enabled="False"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Contraseña:"></asp:Label>
    <br />
    <asp:TextBox ID="contraseñaTB" runat="server" AutoPostBack="True" Width="230px" Enabled="False"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="buscarBT" runat="server" Text="Buscar Archivos" Width="130px" OnClick="buscarBT_Click" />
    &nbsp;<br />
    <asp:Label ID="buscarLB" runat="server" Text="-"></asp:Label>
    <br />
    <asp:GridView ID="listaArchivosGV" runat="server" OnRowCommand="listaArchivosGV_RowCommand">
        <Columns>
            <asp:ButtonField Text="Descargar" ButtonType="Button" CommandName="descargar" HeaderText="Descargar" />
            <asp:ButtonField Text="Eliminar" ButtonType="Button" CommandName="eliminar" HeaderText="Eliminar" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" Width="294px" />
    <br />
    <br />
    <asp:Button ID="guardarBT" runat="server" Text="Guardar Archivo" Width="182px" OnClick="guardarBT_Click" />
    <br />
    <asp:Label ID="guardarLB" runat="server" Text="-"></asp:Label>
    <br />
</asp:Content>
