using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class frmSystem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserCode"] != null)
            {
                Admin_CommonCls.CommonCheckSession();
                GetSystem();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
    public void GetSystem()
    {
        DataSet ds = Admin_CommonCls.CallApiGet("UserSystem/GetUserSystem?Ind=1&UserCode=" + Session["UserCode"].ToString());
        //DataTable dt = JsonConvert.DeserializeObject<DataTable>(res.data.ToString());
        string Dashboardlist = "";
        // Session["SystemCode"] = dt.Rows[0]["SystemCode"].ToString();
        HtmlGenericControl htmldTag;
        DropDownList dropDownList = new DropDownList();
        dropDownList.ID = "ddlMonth";
        DataTable dtSalaryMonth = GetSalaryMonth();
        if (ds == null)
        {
            pnlfailed.InnerText = "Not Permit To Any System Please Contact Your Administrator.";
            pnlfailed.Visible = true;
            pnlfailed.Style.Add("display", "inline-block");
            pnlfailed.Style.Add("color", "red");
            return;
        }
        if (ds.Tables[0].Rows.Count > 0)
        {
            Dashboardlist += "<div class='container' style='max-width:1230px'>";
            Dashboardlist += "<div class='row'>";

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["SystemCode"].ToString() == "101")
                {
                    htmldTag = new HtmlGenericControl("select");

                    Dashboardlist += "<div class='col-xl-3 runat='server' id='div0'>";
                    Dashboardlist += "<div class='panel box1 box-model blue-color change-part hover-shadow blue-color'>";
                    Dashboardlist += "<div class='panel-body before-part'>";
                    Dashboardlist += "<div class='row fixed-padding'>";
                    Dashboardlist += "<div class='col-xs-3'><a href='#'><i class='" + ds.Tables[0].Rows[i]["SysIcon"] + "'></i> </div>";
                    Dashboardlist += "<div class='col-xs-9'>";
                    Dashboardlist += "<div class='huge'>";
                    Dashboardlist += "<div>";
                    Dashboardlist += "<h4 class='mb-3 mt-4'>" + ds.Tables[0].Rows[i]["SystemName"] + "</h4></div>";
                    Dashboardlist += "</div></div></div>";
                    Dashboardlist += "<div class='panel-footer'>";
                    Dashboardlist += "<span class='pull-left'></span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i><div class='clearfix'></div></span></div>";
                    Dashboardlist += "</a></div>";
                    Dashboardlist += "<div class='panel-body after-part'>";
                    Dashboardlist += "<div class='inner-after'>";
                    Dashboardlist += "<div class='row'>";
                    Dashboardlist += "<div class='col-xs-12'>";
                    Dashboardlist += "<div class='form -group'>";
                    Dashboardlist += "<label class='col-xs-12 text-white fs-2'>Select Month</label>";
                    Dashboardlist += "<div class='col-xs-12'>";
                    Dashboardlist += "<select name = 'ddlMonthSalary' id='ddlMonth' class='form-control my-4' runat='server'>";
                    Dashboardlist += "<option value='0'> --Select Month -- </option>";
                    if (dtSalaryMonth != null && dtSalaryMonth.Rows.Count > 0)
                    {
                        for (int sal = 0; sal < dtSalaryMonth.Rows.Count; sal++)
                        {
                            Dashboardlist += "<option value=" + dtSalaryMonth.Rows[sal]["monthcd"].ToString() + "> " + dtSalaryMonth.Rows[sal]["MOnthDesc"].ToString() + " </option>";
                        }
                    }
                    //Dashboardlist += "<option value='0'> --Select Month -- </option>";
                    //Dashboardlist += "<option value='228'> DECEMBER - 2023 </option>";
                    Dashboardlist += "</select>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "<div class='col-xs-12 text-center d-flex justify-content-around'>";
                    Dashboardlist += "<input type='submit' name='ctl00$ContentPlaceHolder1$btnSalarySystem' value='Continue' onclick='return SalaryValid();' id='ContentPlaceHolder1_btnSalarySystem' class='btn btn-success'/>";
                    Dashboardlist += "<button id='cancel_button' class='btn btn-danger'>Cancel</button>";
                    Dashboardlist += "</div></div></div></div></div></div></div>";
                }
                else
                {
                    Dashboardlist += "<div class='col-xl-3' id='div" + i + "' runat='server'>";
                    Dashboardlist += "<div class='" + ds.Tables[0].Rows[i]["Css_Style"] + "'>";
                    Dashboardlist += "<div class='panel-body before-part'>";
                    Dashboardlist += "<div class='row'>";
                    Dashboardlist += "<div class='col-xs-3'>";
                    Dashboardlist += "<a href='" + ResolveUrl(ds.Tables[0].Rows[i]["TargetUrl"].ToString()) + "'>";
                    Dashboardlist += "<i class='" + ds.Tables[0].Rows[i]["SysIcon"] + "'></i>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "<div class='col-xs-9'>";
                    Dashboardlist += "<div class='huge'>";
                    Dashboardlist += "<div>";
                    Dashboardlist += "<h4 class='mb-3 text-white mt-4'>" + ds.Tables[0].Rows[i]["SystemName"] + "</h4>";
                    Dashboardlist += "</div></div></div>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "<div class='panel-footer'>";
                    Dashboardlist += "<span class='pull-left'></span>";
                    Dashboardlist += "<span class='pull-right'>";
                    Dashboardlist += "<i class='fa fa-arrow-circle-right'></i>";
                    Dashboardlist += "<div class='clearfix'></div>";
                    Dashboardlist += "</a>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "</div>";
                    Dashboardlist += "</div>";
                }
            }
            Dashboardlist += "</div>";
            Dashboardlist += "</div>";
            Systemlist.InnerHtml = Dashboardlist;
        }
    }
    public DataTable GetSalaryMonth()
    {
        DataTable dtSal = new DataTable();
        dtSal = Salary_CLSCommon.CallApiGetdt("Login/FillMonth?Ind=3&CityCode=" + Session["CityCode"] + "");
        //if (dtSal != null)
        //{
        // DataTable dt = JsonConvert.DeserializeObject<DataTable>(dtSal.data.ToString());
        //    DropDownList dropDownList = new DropDownList();
        //    dropDownList.ID = "ddlMonth";
        //    if (dt.Rows.Count > 0)
        //    {
        //        dropDownList.DataSource = dt;
        //        dropDownList.DataValueField = "monthcd";
        //        dropDownList.DataTextField = "MOnthDesc";
        //        dropDownList.DataBind();
        //        dropDownList.Items.Insert(0, new ListItem("-- Select Month -- ", "0"));
        //    }
        //}
        return dtSal;
    }
    public void btnSalarySystem(string ddlMonthSalaryVal, string ddlMonthSalaryDesc)
    {
        Session["CorpName"] = Session["OrgName"];
        Session["UserId"] = Session["UserCode"];
        Session["LevelId"] = Session["UserLevel"];
        Session["MonthCd"] = ddlMonthSalaryVal;
        Session["MonthDesc"] = ddlMonthSalaryDesc;
        //Response.Redirect("~/Estate/Estate_Dashboard.aspx");
    }
    [WebMethod]
    public static string setSessionValue(string ddlMonthSalaryVal, string ddlMonthSalaryDesc)
    {
        frmSystem frmobj = new frmSystem();
        frmobj.btnSalarySystem(ddlMonthSalaryVal, ddlMonthSalaryDesc);
        return "";
    }
}
