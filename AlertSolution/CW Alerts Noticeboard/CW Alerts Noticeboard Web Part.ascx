<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CW Alerts Noticeboard Web Part.ascx.cs" Inherits="AlertSolution.CW_Alerts_Noticeboard_Web_Part.CW_Alerts_Noticeboard_Web_Part" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/Style Library/custom/alerts-noticeboard.css"/>

<script>
    function LoadAlertsNoticeboardContents() {

        var siteUrl = _spPageContextInfo.webAbsoluteUrl;
        var dateTxt = new Date().toISOString().substring(0, 10);
        var modifyDate = dateTxt + "T13:00:00Z";
        //console.log(modifyDate);
        //console.log(_spPageContextInfo);
        //var urlForList = siteUrl + "/Lists/AlertsList/AllItems.aspx";
        $.ajax({
            url: siteUrl + "/_api/web/lists/getbytitle('Alerts Noticeboard')/items?$filter=StartDate lt datetime'" + modifyDate + "' and EndDate ge datetime'" + modifyDate + "'",
            method: "GET",
            headers: { "Accept": "application/json; odata=verbose" },
            success: function (data) {
                // Returning the results
                var listItems = data.d.results;

                // Remove the placeholder as we have successfully looked for alerts
                $('#coliban-alerts-loading-placeholder').remove();

                for (i = 0; i < listItems.length; i++) {
                    var alertDiv = "<div class=\"alertDiv\"><div class=\"alertType " + listItems[i].AlertType + "\"><i class=\"fa fa-bell\" aria-hidden=\"true\"></i> alert<div class=\"alertAngle\"></div></div><div class=\"alertText\">" + listItems[i].Title + " <a href=\"https://google.com\">Read More</a> </div></div>";
                    $("#alertsSpace").append(alertDiv);
                }
            },
            error: function (data) {
                $('#coliban-alerts-loading-placeholder').html("<p>An error occurred whilst looking for alerts. Please ensure that you have enabled the CW Alerts Management feature in your site's settings.</p>");
            }
        });
    }

    $(document).ready(LoadAlertsNoticeboardContents());
</script>



<div id="alertsSpace">
    <span id="coliban-alerts-loading-placeholder"><i class="fa fa-spinner fa-pulse fa-3x fa-fw" aria-hidden="true"></i> Looking for current alerts...</span>
</div>