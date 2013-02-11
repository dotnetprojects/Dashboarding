<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="AspNetApplication.Extras.Contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>Downloads and contacts</h2>

<p>The <asp:HyperLink ID="HyperLink3" NavigateUrl="http://www.codeplex.com/dashboarding/" runat="server">Codeplex
home page</asp:HyperLink> has the latest breaking news. </p>

<p>The easiest point of contact if you have questions  is to post on the  
    <asp:HyperLink ID="HyperLink1" NavigateUrl="http://www.codeplex.com/dashboarding/Thread/List.aspx" runat="server">Codeplex
discussion group</asp:HyperLink>. It automatically emails me to let me know there is a new or changed discussion. I will do my best to answer 
any questions as soon as I can but during the week work will come first.</p>

<p>Issues, feature requests, complaints  etc should be posted to the <asp:HyperLink ID="HyperLink2" NavigateUrl="http://www.codeplex.com/dashboarding/WorkItem/List.aspx" runat="server">Codeplex
issue tracker</asp:HyperLink>  for the project</p>



</asp:Content>
