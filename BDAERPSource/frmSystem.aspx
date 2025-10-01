<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMasterPage.master" AutoEventWireup="true" CodeFile="frmSystem.aspx.cs" Inherits="frmSystem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        .fixed-padding{
            padding: 30px 0 0 !important;
        }
        .change-part {
          
            overflow: hidden;
            position: relative;
            color: #000;
            box-shadow: 0 0 1px 1px rgba(0,0,0,0.1);
            border: 0;
            border-radius: 4px;
        }
            .change-part .before-part {
                position: absolute !important;
                top: -30px;
                left: 0;
                height: 150px;
                width: 100%;
                z-index: 2;
                color: #383838;
                cursor: pointer;
            }

            .change-part.active .before-part {
                top: -250px;
                animation: animater 0.8s ease;
            }

            .change-part.in-active .before-part {
                top: 0px;
                animation: ranimater 0.8s ease;
            }

            .change-part .fa {
                font-size: 50px;
              color: #fff;
            }

            /*.change-part h4 {
                font-size: 20px;
            }*/

            .change-part .after-part {
                position: absolute;
                top: 250px;
                left: 0;
                height: 150px;
                width: 100%;
              
                z-index: 1;
            }

            .change-part.active .after-part {
                top: 0;
                animation: animater2 0.8s ease;
            }

            .change-part.in-active .after-part {
                top: 250px;
                animation: ranimater2 0.8s ease;
            }


        .inner-after {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 100%;
            padding: 15px;
        }

        @keyframes animater {
            from {
                top: 0;
            }

            to {
                top: -250px;
            }
        }

        @keyframes animater2 {
            from {
                top: 250px;
            }

            to {
                top: 0px;
            }
        }

        @keyframes ranimater {
            from {
                top: -250px;
            }

            to {
                top: 0;
            }
        }

        @keyframes ranimater2 {
            from {
                top: 0;
            }

            to {
                top: 250px;
            }
        }

        .hover-shadow.active {
            box-shadow: 0 0 5px 1px rgba(0,0,0,0.2);
        }

        .after-part .inner-after {
            top: 50%;
        }

        .before-heading {
            position: absolute;
            top: 0;
            left: 0;
            padding: 9px 4px;
           
            width: 100%;
            color: #fff;
            text-align: center;
            font-weight: bold;
            display: none;
        }

        .btn1 {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }
      .box1 .panel-body{
          padding: 8px
      }
    .col-xs-3 > a > i{
              font-size: 50px;
              color: #fff;
      }
    #ContentPlaceHolder1_pnlfailed{
            display: inline-block;
    color: red;
    position: absolute;
    left: 0;
    right: 0;
    bottom: 40%;

    }
    </style>
    <script lang="javascript" type="text/javascript">     
        $(document).ready(function () {
            $(".blue-color").click(function () {
                $(".change-part").addClass("active");
            })
            $("#cancel_button").click(function () {
                $(".change-part").removeClass("active");
                return false
            })

        });
        function addcourse() {

        }

        $('form').on('click', 'button', function (evt) {
            evt.preventDefault();
            addcourse();
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <%--  <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
     <script type="text/javascript">
         function SalaryValid() {
             var ddlmonth = document.getElementById("ddlMonth");
             if (ddlmonth.value == "0") {
                 alert("Please Select Month.");
                 ddlmonth.focus();
                 return false;
             }
             else {
                 /*PageMethods.btnSalarySystem();*/
                 PageMethods.setSessionValue(ddlmonth.value, ddlmonth.selectedOptions[0].innerText, onSuccess, onFailure);
             }
         }

         function onSuccess(result) {
             window.location.href = "<%= ResolveUrl("~/Salary/Salary_Dashboard.aspx")%>";
         }

         function onFailure(error) {
         }
     </script>
    <div id="Systemlist" runat="server">
    </div>

    <%--<asp:Button ID="btnConti" CssClass="btn btn-success" Text="Continue" runat="Server" OnClick="btnConti_Click" />--%>
    <%--<div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="panel box1 box-model">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-home fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <br />
                                    01
                                </div>
                                <div>No of Buildings</div>
                            </div>
                        </div>
                    </div>
                    <a href="">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>

                </div>
            </div>

            <div class="col-lg-3">
							<div class="panel box2 box-model">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-user fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">
												<br/>78
											</div>
											<div>No of Member</div>
										</div>
									</div>
								</div>
								<a href="view/orders">
									<div class="panel-footer">
										<span class="pull-left">View Details</span>
										<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="panel box3 box-model">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-inr fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">
												<br/>12000
											</div>
											<div>Maintenance Of Month</div>
										</div>
									</div>
								</div>
								<a href="view/orders">
									<div class="panel-footer">
										<span class="pull-left">View Details</span>
										<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="panel box4 box-model">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-tasks fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">
												<br/>07
											</div>
											<div>Pending Complain</div>
										</div>
									</div>
								</div>
								<a href="view/orders">
									<div class="panel-footer">
										<span class="pull-left">View Details</span>
										<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
       </div>
    </div>--%>
    <%--    <div class="col-xs-12 col-lg-3 col-sm-6">
                        <div class="panel panel-default change-part hover-shadow" id="box-model1">
                            <div class="panel-body before-part">
                                <div class="inner-after">
                                    <div class="row">
                                        <div class="col-xs-12 text-center">
                                            <i class="fa fa-calculator"></i>
                                            <h4>Salary System</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            

                        </div>
                    </div>--%>
    <h1 class="alertMsg failed text-center" runat="server" id="pnlfailed"></h1>
</asp:Content>

