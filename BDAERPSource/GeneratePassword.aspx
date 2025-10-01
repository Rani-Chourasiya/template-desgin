<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GeneratePassword.aspx.cs" Inherits="GeneratePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Panel</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="<%= ResolveUrl("~/assets/media/logos/BDA-LOGO.jpg")%>" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <link href="<%= ResolveUrl("~/assets/plugins/global/plugins.bundle.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/assets/css/style.bundle.css")%>" rel="stylesheet" type="text/css" />
    <!--end::Global Stylesheets Bundle-->
    <link href="<%= ResolveUrl("~/assets/css/style.css")%>" rel="stylesheet" type="text/css" />
     <%-- new style --%>
    <link href="<%= ResolveUrl("~/assets/css/New-style.css")%>" rel="stylesheet" type="text/css" />

    <link href="<%= ResolveUrl("~/assets/css/New-style.bundle.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/assets/css/New-Newstyle_Salary")%>" rel="stylesheet" type="text/css" />
</head>
<body id="kt_body" class="login_bg app-blank bgi-size-cover bgi-attachment-fixed bgi-position-center">
    <form id="form1" runat="server">
        <div>
            <!--begin::Theme mode setup on page load-->
            <script>
                var defaultThemeMode = "light";
                var themeMode;
                if (document.documentElement) {
                    if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
                        themeMode = document.documentElement.getAttribute("data-bs-theme-mode");
                    } else {
                        if (localStorage.getItem("data-bs-theme") !== null) {
                            themeMode = localStorage.getItem("data-bs-theme");
                        } else {
                            themeMode = defaultThemeMode;
                        }
                    }
                    if (themeMode === "system") {
                        themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
                    }
                    document.documentElement.setAttribute("data-bs-theme", themeMode);
                }
                //$("#txtpassword").keyup(function (event) {
                //    if (event.keyCode === 13) {
                //        $("#btnLogin").click();
                //    }
                //});  

                function funfordefautenterkey1(btn, event) {
                    if (document.all) {
                        if (event.keyCode == 13) {
                            event.returnValue = false;
                            event.cancel = true;
                            btn.click();
                        }
                    }
            </script>

            <!--begin::Root-->
            <div class="d-flex flex-column flex-root" id="kt_app_root">
                <!--begin::Authentication - Sign-in -->
                <div class="container-fluid">
                    <div class="fixed-both-grid">
                    <div class="row g-0 login-row">
                        <div class="col-md-6 fixed-dashboard-card bg-body">
                            <div class="d-flex flex-center">
                                <div class="logo_img_login">
                                    <img class="theme-light-show mx-auto mw-100 w-150px" src="<%= ResolveUrl("~/assets/media/login/istockphoto-1497684257-612x612.jpg")%>" alt="" />
                                    <img class="theme-dark-show mx-auto mw-100 w-150px" src="<%= ResolveUrl("~/assets/media/login/istockphoto-1497684257-612x612.jpg")%>" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 fixed-dashboard-card bg-body">
                            <div class="px-10 pt-7">
                                <!--begin::Wrapper-->
                                <%--<div class="">
                                    <div class="">--%>
                                        <div class="d-flex flex-column flex-column-fluid pb-2 pb-lg-2">
                                            <div class="text-center mb-2 mt-2">
                                                <img alt="Logo" src="<%= ResolveUrl("~/assets/media/logos/BDA-LOGO.jpg")%>" width="70" />
                                                <h2 class="text-gray-900 fw-bolder mt-4 fs-5 sign-in-text">Generate Password  <br /> Forgot Password</h2>
                                                <h2 class="text-gray-500 fw-semibold fs-6 text-dark mb-8 mt-2">Login From User Name & Password </h2>
                                            </div>
                                            <div class="fv-row mb-3">
                                                <label class="fw-semibold pb-2 fs-6"><i class="fa-solid fa-user"></i>  User Name </label>
                                                <asp:TextBox runat="server" ID="txtUsername" placeholder="User Name" autocomplete="off" class="form-control bg-transparent" MaxLength="60"></asp:TextBox>
                                            </div>
                                            <div class="fv-row mb-3">
                                                <label class="fw-semibold pb-2 fs-6"><i class="fa-solid fa-lock"></i>  Mobile Number </label>
                                                <asp:TextBox runat="server" ID="TxtMobileNo" MaxLength="10" placeholder="Enter Mobile Number" name="mobileno" autocomplete="off" class="form-control bg-transparent"></asp:TextBox>
                                            </div>
                                            <div class="fv-row mb-3" id="pnlOtp" runat="server" visible="false">
                                                <label class="fw-semibold pb-2 fs-6"><i class="fa-solid fa-lock"></i>  Enter OTP</label>
                                                <asp:TextBox runat="server" ID="TxtOtp" MaxLength="6" placeholder="Enter OTP" name="mobileno" autocomplete="off" class="form-control bg-transparent"></asp:TextBox>
                                            </div>
                                            <div runat="server" visible="false" class="row" id="pnlGetUser">
                                                <div class="form-group mb-3 col-md-6">
                                                    <label class="form-label" for="TxtPassword"><i class="fa-solid fa-lock"></i>  Password</label>
                                                    <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" MaxLength="15" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
                                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must be 8-10 characters long with at least one numeric,one upper case character and one special character." Display="Dynamic" ForeColor="Red" ControlToValidate="TxtPassword" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$"></asp:RegularExpressionValidator>--%>
                                                </div>
                                                <div class="form-group mb-3 col-md-6">
                                                    <label class="form-label" for="TxtConfirmPassword"><i class="fa-solid fa-lock"></i>  Confirm Password</label>
                                                    <asp:TextBox ID="TxtConfirmPassword" TextMode="Password" runat="server" MaxLength="15" placeholder="Enter Confirm Password" CssClass="form-control"></asp:TextBox>
                                                    <asp:CompareValidator ControlToCompare="TxtPassword" runat="server" ID="CompValdation" ErrorMessage="Confirm password must be same as password" ForeColor="Red" ControlToValidate="TxtConfirmPassword" Display="Dynamic"></asp:CompareValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-grid mb-4">
                                            <asp:Button ID="BtnSendOtp" runat="server" CssClass="btn btn-submit " OnClick="BtnSendOtp_Click" Text="Send OTP" Visible="true" />
                                            <asp:Button ID="BtnOtp" runat="server" Text="Verify Otp" OnClick="BtnOtp_Click" CssClass="btn btn-primary  text-white" Visible="false" />
                                            <asp:Button ID="BtnSetPassword" runat="server" Text="Set Password" OnClick="BtnSetPassword_Click" OnClientClick="return CheckPasswordValidation()" CssClass="btn btn-primary  text-white" Visible="false" />
                                            <span class="indicator-progress">Please wait...    <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                        </div>
                                        <asp:Label ID="lblmsg" runat="server" CssClass="errorMsg" ForeColor="Red" Visible="false"></asp:Label>
                                        <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-2">
                                            <a href="<%=ResolveUrl("~/Login.aspx") %>" class="genrate-pass">Login User </a>
                                        </div>
                                    <%--</div>--%>
                                    <!--end::Wrapper-->
                                <%--</div>--%>
                                <!--end::Content-->
                            </div>
                            </div>
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Body-->
                </div>
            </div>
            <!--end::Authentication - Sign-in-->
        </div>
        <!--end::Root-->

        <!--begin::Global Javascript Bundle(mandatory for all pages)-->
        <script src="<%= ResolveUrl("~/assets/plugins/global/plugins.bundle.js")%>"></script>
        <script src="<%= ResolveUrl("~/assets/js/scripts.bundle.js")%>"></script>
        <!--end::Global Javascript Bundle-->
        <!--begin::Custom Javascript(used for this page only)-->
        <script src="<%= ResolveUrl("~/assets/js/custom/authentication/sign-in/general.js")%>"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </form>
</body>
</html>
