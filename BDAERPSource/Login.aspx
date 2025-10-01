<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
                            <!--begin::Body-->
                            <div class="col-md-6 fixed-dashboard-card bg-body">
                                <div class="px-10 pt-7">
                                    <%--<div class="">
                                        <div class=" ">--%>
                                            <div class="d-flex flex-column flex-column-fluid pb-2 pb-lg-2">
                                                <!--begin::Form-->
                                                <%--<form class="form w-100" novalidate="novalidate" id="kt_sign_in_form" data-kt-redirect-url="/metronic8/demo1/../demo1/index.html" action="#">--%>
                                                <div class="text-center mt-2">
                                                    <img alt="Logo" src="<%= ResolveUrl("~/assets/media/logos/BDA-LOGO.jpg")%>" width="70" />
                                                    <h1 class="text-gray-900 fw-bolder mb-3 mt-4 sign-in-text">Sign In</h1>
                                                
                                                </div>
                                                <asp:Panel ID="PnlLogin" runat="server" DefaultButton="BtnSendOtp">
                                                    <h2 class="text-gray-500 fw-semibold fs-5 text-dark mb-8 mt-2">Login From User Name & Password </h2>
                                                    <div class="fv-row mb-5">
                                                        <label class="fw-semibold fs-6"><i class="fa-solid fa-user"></i>  User Name </label>
                                                        <%--<input type="text" placeholder="Email" name="email" autocomplete="off" class="form-control bg-transparent" />--%>
                                                        <asp:TextBox runat="server" ID="txtUsername" placeholder="User Name" autocomplete="off" class="form-control bg-transparent" MaxLength="60"></asp:TextBox>
                                                    </div>
                                                    <div class="fv-row mb-5">
                                                        <label class="fw-semibold fs-6"><i class="fa-solid fa-lock"></i>  Password </label>
                                                        <%--<input type="password" placeholder="Password" name="password" autocomplete="off" class="form-control bg-transparent" />--%>
                                                        <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" MaxLength="15" placeholder="Password" name="password" autocomplete="off" class="form-control bg-transparent"></asp:TextBox>
                                                    </div>
                                                    <%--<div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-8">--%>
                                                    <!--begin::Link-->
                                                    <%--	<a href="reset-password.html" class="link-primary"> <i class="fa-solid fa-key"></i> Forgot Password ? </a>--%>
                                                    <!--end::Link-->
                                                    <%--  </div>--%>
                                                    <div class="d-grid mb-4">
                                                        <%--<button type="submit" id="kt_sign_in_submit" class="btn btn-primary" >--%>
                                                        <%--<asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Sign In" CssClass="btn btn-primary" />--%>
                                                        <%-- <asp:LinkButton runat="server" ID="BtnSendOtp" OnClick="BtnSendOtp_Click"  Text="Send OTP" CssClass="btn btn-primary">
												    <span class="indicator-label">
                                                        <i class="fa-solid fa-right-to-bracket"></i>Sign In</span>
												    </asp:LinkButton>--%>
                                                        <asp:Button ID="BtnSendOtp" runat="server" CssClass="btn btn-submit " OnClick="BtnSendOtp_Click" Text="Send OTP" />
                                                        <span class="indicator-progress">Please wait...    <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="PnlOtp" runat="server" DefaultButton="BtnOtp" Visible="false">
                                                    <div class="fv-row mb-8">
                                                        <label class="fw-semibold pb-2 fs-6"><i class="fa-solid fa-user"></i>  Enter OTP </label>
                                                        <asp:TextBox runat="server" ID="TxtOtp" placeholder="Enter OTP" autocomplete="off" class="form-control bg-transparent" MaxLength="6"></asp:TextBox>
                                                    </div>
                                                    <div class="d-grid mb-10">
                                                        <asp:Label ID="Label1" runat="server" CssClass="errorMsg" ForeColor="Red" Visible="false"></asp:Label>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:Button ID="BtnOtp" runat="server" Text="Verify Otp" CssClass="btn btn-primary form-control" OnClick="BtnOtp_Click" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Button ID="btnResendOtp" runat="server" Text="Resend OTP" OnClick="btnResendOtp_Click" CssClass="btn btn-warning form-control" />
                                                            </div>
                                                        </div>
                                                        <span class="indicator-progress">Please wait...    <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Label ID="lblmsg" runat="server" CssClass="errorMsg mb-5" ForeColor="Red" Visible="false"></asp:Label>
                                                <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-8">
                                                    <a href="<%=ResolveUrl("~/GeneratePassword.aspx") %>" class=" genrate-pass text-dark-login">Generate Password/Forgot Password </a>
                                                </div>
                                                <!--begin::Sign up-->
                                                <%--<div class="text-gray-500 text-center fw-semibold fs-6"> Not a Member yet? <a href="sign-up.html" class="link-primary">
               Registration
            </a> </div>--%>
                                                <!--end::Sign up-->
                                                <%--</form>--%>
                                                <!--end::Form-->
                                            </div>
                                            <!--end::Wrapper-->
                                        <%--</div>--%>
                                        <!--end::Content-->
                                    <%--</div>--%>
                                </div>
                                <!--end::Wrapper-->
                            </div>
                            <!--end::Body-->
                        </div>
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
        </div>
    </form>
</body>
</html>
