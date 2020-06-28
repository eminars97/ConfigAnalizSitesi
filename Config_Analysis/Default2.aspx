<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
     <!-- image CSS-->
    <link href="css/image_css.css" rel="stylesheet" media="all">

    <!-- search_button CSS-->
    <%-- <link href="css/test.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    --%>

    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <br />
        <br />
        <br />
        <br />
        <br />


    </p>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-2">
                    <br />
                    <br />
                    <br />
                </div>
                <div class="col-6">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Dotted" BorderColor="Olive"> </asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnFilter" runat="server" Text="Ara" OnClick="btnFilter_Click" />
                </div>
                <div class="col-4">
                </div>
            </div>


            <%--<asp:Button ID="btnFilter" runat="server" OnClick="btnFilter_Click"><i class="fa fa-search"></i></asp:Button>--%>





            <div class="table-responsive table-responsive-data2">
                <table class="table table-data2">
                    <thead>
                        <tr>

                            <th>Parameter</th>
                            <th>Value</th>
                            <th>Frame</th>
                            <th>FrameRate</th>
                            <th>Bitrate</th>
                            <th>Y-PSNR</th>
                            <th>U-PSNR</th>
                            <th>V-PSNR</th>
                            <th>YUV-PSNR</th>
                            <th>Total Second</th>
                            <th>Output Image</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptTestData" runat="server" OnItemCommand="rptTestData_ItemCommand">


                            <ItemTemplate>
                                <tr class="tr-shadow">
                                    <td><%# Eval("parameter") %></td>
                                    <td><%# Eval("value") %> </td>
                                    <td><%# Eval("total_frame") %></td>
                                    <td><%# Eval("frame_rate") %></td>
                                    <td><%# Eval("bitrate") %></td>
                                    <td><%# Eval("y_psnr") %></td>
                                    <td><%# Eval("u_psnr") %></td>
                                    <td><%# Eval("v_psnr") %></td>
                                    <td><%# Eval("yuv_psnr") %></td>
                                    <td><%# Eval("total_second") %></td>
                                    <td>
                                        <img src='TestOutput/<%#Eval("output_image") %>' width="200" style="cursor: pointer" onclick="return LoadDiv(this.src);" /></td>

                                    <td>
                                        <div class="table-data-feature">
                                            <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                <i class="zmdi zmdi-mail-send"></i>
                                            </button>
                                            <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                <i class="zmdi zmdi-edit"></i>
                                            </button>
                                            <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                <i class="zmdi zmdi-delete"></i>
                                            </button>
                                            <button class="item" data-toggle="tooltip" data-placement="top" title="More">
                                                <i class="zmdi zmdi-more"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="spacer"></tr>
                            </ItemTemplate>

                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <div id="divBackground" class="modal">
            </div>
            <div id="divImage">
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td valign="middle" align="center">
                            <img id="imgLoader" alt="" src="images/loader.gif" />
                            <img id="imgFull" alt="" src="" style="display: none;" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="bottom">
                            <input id="btnClose" type="button" value="close" onclick="HideDiv()" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

