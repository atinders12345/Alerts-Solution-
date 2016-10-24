<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Inherits="AlertSolution.ListManagementPageModule.AlertsManagement"  MasterPageFile ="~masterurl/default.master" %>
<%@ Register tagprefix="WebPartPages" namespace="Microsoft.SharePoint.WebPartPages" assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">

</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">


    <asp:Label runat="server" ID="MyLabel" >	</asp:Label>

    <asp:Panel ID="WebZoneHolder" runat="server" ></asp:Panel>
       <WebPartPages:WebPartZone
      id="WebPartZone1"
      runat="server"
      title="Zone 1"
      PartChromeType="TitleAndBorder"></WebPartPages:WebPartZone>
<script type="text/javascript">
$( function() {
   // $( "#tabs" ).tabs();
});

function displayAllAlerts(){
    $("#tabs").tabs("option", "active", 1);

}

function displayActiveAlerts() {

    $("#tabs").tabs("option", "active", 2);
}
function displayInactiveAlerts() {

    $("#tabs").tabs("option", "active", 3);
}

</script>
<style type="text/css">
.ui-tabs .ui-tabs-nav{
	height:40px;
}
.ui-tabs .ui-tabs-nav li{
	width:33%;
}
.ui-tabs .ui-tabs-nav .ui-tabs-anchor{
	width:95%;
}
.ui-widget-header .ui-state-active{
	background-color:#ff4500;
}
.ui-widget-content{
	border:none!important;
}
.alertText span{
    display:block;
    background-color:#e6e6e6;
    padding:10px;
    margin-bottom:5px;
    
}
.Green{
    border-left:green solid 15px;
}
.Red{
    border-left:red solid 15px;
}
.Orange{
    border-left:orange solid 15px;
}
.ms-menutoolbar{margin-bottom:10px;}
</style>


</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
My Application Page
</asp:Content>
