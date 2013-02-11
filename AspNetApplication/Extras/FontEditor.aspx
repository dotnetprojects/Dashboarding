<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FontEditor.aspx.cs" Inherits="AspNetApplication.Extras.FontEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Font editor</h2>
<p>This is the font editor used to create the fonts for the dot matrix display. Only really
useful to me but it needs a host.</p>

<div>



<object type="application/x-silverlight" width="650" height="400">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=FontEditor" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>

</div>

</asp:Content>
