using Microsoft.SharePoint;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SharePoint.WebPartPages;
using System.Web.UI.WebControls.WebParts;
namespace AlertSolution.ListManagementPageModule
{
    public class AlertsManagement : Page
    {
 
        protected Label MyLabel;
       
        private SPList oList;
       

        protected void Page_Init(object sender, EventArgs e)
        {

            
        }
        protected void Page_Load(object sender, EventArgs e)
        {

    

            setUpList(0);




            SPQuery oQuery = new SPQuery();
            oQuery.Query = "<Query><OrderBy><FieldRef Name = 'ID' Ascending='TRUE'/></OrderBy></Query> ";
           
            
        }

        protected void setUpList(int baseId)
        {
            string siteUrl = SPContext.Current.Web.Url;
            SPSite oSiteCollection = SPContext.Current.Site;
            oList = SPContext.Current.Web.Lists["Alerts Noticeboard"];
            SPWeb web = SPContext.Current.Web;


            web.AllowUnsafeUpdates = true;
            string pageUrl = "SitePages/managealerts.aspx";
            SPFile page = web.GetFile(pageUrl);
            SPLimitedWebPartManager wpmgr = page.GetLimitedWebPartManager(PersonalizationScope.Shared);
            Guid storageKey = Guid.NewGuid();
            string wpId = String.Format("g_{0}", storageKey.ToString().Replace('-', '_'));



            SPLimitedWebPartCollection WebParts = wpmgr.WebParts;


            
            XsltListViewWebPart xwp = new XsltListViewWebPart();
            
      
            
          
            //SPViewCollection viewsCol = oList.Views;
           
            xwp.ID = wpId;
            xwp.ListName = oList.ID.ToString("B").ToUpper(); 
           
         
        
            
           
            wpmgr.AddWebPart(xwp, "WebPartZone1", 0);
            if (WebParts.Count > 1) { wpmgr.DeleteWebPart(xwp); }
          

        }

        


   
   
}

}
