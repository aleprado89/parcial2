<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Registracion.aspx.cs" Inherits="parcial2.Registracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Mail:"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="mailTB" runat="server" Width="230px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mailTB" ErrorMessage="Debe ingresar un mail válido" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Debe ingresar un mail válido</asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mailTB" ErrorMessage="Campo mail vacío" Font-Bold="True" ForeColor="Red">Campo mail vacío</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Username:"></asp:Label>
&nbsp;</p>
    <p>
        <asp:TextBox ID="usuarioTB" runat="server" Width="230px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usuarioTB" ErrorMessage="Campo usuario vacío" Font-Bold="True" ForeColor="Red">Campo usuario vacío</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Edad:"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="edadTB" runat="server" Width="150px" TextMode="Number"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="edadTB" ErrorMessage="Debe ingresar una edad mayor a 15" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="16" Type="Integer">Debe ingresar una edad mayor a 15</asp:RangeValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="edadTB" ErrorMessage="Campo edad vacío" Font-Bold="True" ForeColor="Red">Campo edad vacío</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Contraseña:"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="contraseña1TB" runat="server" Width="230px" AutoPostBack="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="contraseña1TB" ErrorMessage="Campo contraseña vacío" Font-Bold="True" ForeColor="Red">Campo contraseña vacío</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="Repetir Contraseña:"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="contraseña2TB" runat="server" Width="230px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="contraseña1TB" ControlToValidate="contraseña2TB" ErrorMessage="Contraseña incorrecta" Font-Bold="True" ForeColor="Red">Contraseña incorrecta</asp:CompareValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="contraseña2TB" ErrorMessage="Campo repetir contraseña vacío" Font-Bold="True" ForeColor="Red">Campo repetir contraseña vacío</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="registrarBT" runat="server" OnClick="registrarBT_Click" Text="Registrar Usuario" Width="137px" />
    </p>
    <p>
        <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" />
</asp:Content>
