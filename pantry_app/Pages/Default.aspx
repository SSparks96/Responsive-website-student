<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pantry_app._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1 style="text-align: center">Welcome To the Pantry Wise!!</h1>
</div>


<div class="jumbotron">

<div class=".style2">
    <div>
            
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">

        </asp:ScriptManager>

        <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>

        <asp:Image ID="Image1" runat="server" />

          </div> 
    
         </div>
     </div>
 

    <asp:Panel ID="Panel2" runat="server">
                <ul class="list-inline" style="height: 63px">
          <li>
            <a target="_blank" href="https://facebook.com/sharer.php?u=http://arunendapally.com/post/protect-your-source-code-from-decompiling-or-reverse-engineering" class="social facebook"></a>
          </li>
          <li>
            <a target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&amp;url=http://arunendapally.com/post/protect-your-source-code-from-decompiling-or-reverse-engineering&amp;title=Protect your source code from decompiling or reverse engineering" class="social linkedin"></a>
          </li>
          <li>
            <a target="_blank" href="https://twitter.com/intent/tweet?url=http://arunendapally.com/post/protect-your-source-code-from-decompiling-or-reverse-engineering&amp;text=Protect your source code from decompiling or reverse engineering&amp;via=arunendapally" class="social twitter"></a>
          </li>
            <li>
            <a target="_blank" href="https://plus.google.com/share?url=http://arunendapally.com/post/protect-your-source-code-from-decompiling-or-reverse-engineering" class="social googleplus"></a>
          </li>
        </ul>
    </asp:Panel>

</asp:Content>
