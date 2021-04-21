<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pantry_app._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="jumbotron">
        <h1 style="text-align: center">Welcome To the Pantry Wise!!</h1>
    </div>
      
   <div class="jumbotron">  
     <div class="row"> 
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
           <ContentTemplate>  
        <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick"></asp:Timer>  
        <asp:Image ID="Image1" width="702px" Height="497px" runat="server" style="margin-left: 199px" />  
               <p style="width: 659px; margin-left: 198px">
                   &nbsp;</p>
               <p style="width: 659px; margin-left: 198px">
                   Pantry Wise App</p>
               <p style="width: 659px; margin-left: 198px">
                   <span>Pantry wise is a pantry and fridge organizer, Inventory tracker, grocery list and recipe ideas app accessable only by entering a username and password to safeguard privacy. Pantry wise app saves time and money, can&#39;t miss products while shopping and minimize food wastage through Inventory check. Simply categorize your kitchen into panty or fridge foods or supplies and expiration date.&nbsp; Create and add a recipe and Enjoy a healthy recipe based on your interest. Picture your favorite cooking or products and share in your social media sites.<p></p>
                   </span>
                   <p>
                   </p>
                   <p class="MsoNormal">
                       &nbsp;</p>
                   <p class="MsoNormal">
                       <span>
                       <p>
                           &nbsp;</p>
                       </span>
                       <p>
                       </p>
                   </p>
               </p>
         </ContentTemplate>       
   </asp:UpdatePanel>  
           
    </div> 
  </div> 
       <asp:Panel ID="Panel2" runat="server" Height="46px">
                <ul class="list-inline" style="height: 99px; margin-top: 29;">
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