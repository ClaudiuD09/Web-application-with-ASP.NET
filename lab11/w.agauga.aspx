<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w.agauga.aspx.cs" Inherits="lab11.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        

        <asp:AccessDataSource ID="ADS1" runat="server" DataFile="~/App_Data/BDC.accdb" 
             SelectCommand="SELECT [IdCarte], [Titlu], [An], [Autor] FROM [Carti]" 
             DeleteCommand="DELETE FROM [Carti] WHERE [IdCarte] = ?" 
             InsertCommand="INSERT INTO [Carti] ([Titlu], [An], [Autor]) VALUES (?, ?, ?)" 
             UpdateCommand="UPDATE [Carti] SET [Titlu] = ?, [An] = ?, [Autor] = ? WHERE [IdCarte] = ?">
            <DeleteParameters>
                <asp:Parameter Name="IdCarte" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Titlu" Type="String" />
                <asp:Parameter Name="An" Type="Int32" />
                <asp:Parameter Name="Autor" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Titlu" Type="String" />
                <asp:Parameter Name="An" Type="Int32" />
                <asp:Parameter Name="Autor" Type="String" />
                <asp:Parameter Name="IdCarte" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ADS1" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="Adauga carti" 
style="position:absolute; top: 14px; left: 471px;" OnClick="Button1_Click"/>
        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 54px; left: 467px; width: 481px; height: 214px;">
             <asp:Label ID="LblTitlu" runat="server" Text="Titlu" style="position:absolute; top: 31px;
 left: 18px; bottom: 136px;"></asp:Label>
             <asp:TextBox ID="TxtTitlu" runat="server" style="position:absolute; top: 28px; left: 
81px;"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RFVTitlu" runat="server" ErrorMessage="Completati titlu" 
style="position:absolute; top: 34px; left: 262px;" ControlToValidate="TxtTitlu" SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
             
             <asp:Label ID="LblAn" runat="server" Text="An" style="position:absolute; top: 80px; left: 
22px; bottom: 87px;"></asp:Label>
             <asp:TextBox ID="TxtAn" runat="server" style="position:absolute; top: 77px; left: 83px; 
right: 230px;"></asp:TextBox>
             <asp:RangeValidator ID="RVAn" runat="server" ErrorMessage="An eronat" 
style="position:absolute; top: 80px; left: 274px;" ControlToValidate="TxtAn" MaximumValue="2022" MinimumValue="1500" SetFocusOnError="True">&nbsp;</asp:RangeValidator>

             <asp:Label ID="LblAutor" runat="server" Text="Autor" style="position:absolute; top: 130px; 
left: 23px;" ></asp:Label>
             <asp:DropDownList ID="DdlAutor" runat="server" style="position:absolute; top: 128px; 
left: 91px;">
                 <asp:ListItem></asp:ListItem>
                 <asp:ListItem>Mihail Eminescu</asp:ListItem>
                 <asp:ListItem>Ion Creanga</asp:ListItem>
                 <asp:ListItem>Ion Slavici</asp:ListItem>
                 <asp:ListItem>George Gosbuc</asp:ListItem>
             </asp:DropDownList>
             
             <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" style="position:absolute; 
top: 175px; left: 43px;"/>
             <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" style="position:absolute; 
top: 174px; left: 160px;" CausesValidation="False" OnClick="BtnRenunta_Click"/>

             <asp:CustomValidator ID="CustomValidator1" runat="server" style="position:absolute; 
top: 102px; left: 311px; width: 25px;" OnServerValidate="CustomValidator1_ServerValidate">&nbsp;</asp:CustomValidator>
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="position:absolute; 
top: 137px; left: 270px; width: 199px;" ForeColor="Red"/>
        </asp:Panel>






    </form>
</body>
</html>
