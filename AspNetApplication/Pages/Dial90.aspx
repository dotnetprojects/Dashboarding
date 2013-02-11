<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dial90.aspx.cs" Inherits="AspNetApplication.Pages.Dial90" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>Dial90</h2>

<p>There are four 90<sup>o</sup> dials in the library they are shown below</p>

<center>
<object type="application/x-silverlight" height="611" Width="500">
                    <param name="source" value="../ClientBin/SilverlightApplication.xap" />
                    <param name="initParams" value="demo=Dial90,IsRandom=true" />
                    <param name="background" value="Transparent" />
                    <param name="windowless" value="True" />
                </object>
</center>

</asp:Content>
