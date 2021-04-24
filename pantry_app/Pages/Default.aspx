<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pantry_app._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="jumbotron">
        <h1 style="text-align: center">Welcome To the Pantry Wise!!</h1>
    </div>
      
   <div class="jumbotron">  
     <div class="row"> 
         <div class="column left" style="width: 78%">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                <ContentTemplate>  
                <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>  
                <asp:Image ID="Image1" width="702px" Height="497px" runat="server" style="margin-left: 62px" />  

               </ContentTemplate>       
            </asp:UpdatePanel> 
          </div>
          <div class="column right" style="width: 15%">
                    <p style="color: #FFFFFF; background-color: #000080; text-align: center; width: 212px;">
                        Create the kitchen of your dreams!</p>
                    <p style="color: #FFFFFF; background-color: #000080; width: 215px;"> “The kitchen is the heart of every home, for the most part. It evokes memories of your family history.”&nbsp; Debi Mazar </p>
                    <p style="color: #FFFFFF; background-color: #000080; width: 215px;"> “If you can organise your kitchen, you can organise your life.” – Louis Parrish&nbsp;</p>
                    <p style="color: #FFFFFF; background-color: #000080; width: 215px;"> “Cooking is one of the strongest ceremonies for life.” – Laura Esquivel&nbsp;</p>
                    
          </div>
     </div>

            
                <asp:Panel ID="Panel1" runat="server">
                   <p style="width: 659px; margin-left: 59px">
                   Pantry Wise App</p>
                    <p style="width: 659px; margin-left: 61px">
                   <span>Pantry wise is a pantry and fridge organizer, Inventory tracker, grocery list and recipe ideas app accessable only by entering a username and password to safeguard privacy. Pantry wise app saves time and money, can&#39;t miss products while shopping and minimize food wastage through Inventory check. Simply categorize your kitchen into panty or fridge foods or supplies and expiration date.&nbsp; Create and add a recipe and Enjoy a healthy recipe based on your interest. Picture your favorite cooking or products and share in your social media sites.</span><span></span></asp:Panel>
          
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
