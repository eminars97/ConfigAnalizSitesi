<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TestOutput.aspx.cs" Inherits="TestOutput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
    <!-- image CSS-->
    
    <link href="css/Tasarim.css" rel="stylesheet" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
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
            <asp:TextBox ID="TextBox1" runat="server" > </asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnFilter" runat="server" Text="Ara" OnClick="btnFilter_Click"/>
        </div>
        <div class="col-4">
        </div>
    </div>
    
    
        
        <table class="auto-style1" border="1" id="1">
            <thead>
                <tr class="warning">
                    <th class="auto-style12">Parameter</th>
                    <th class="auto-style7">Value</th>
                    <th class="auto-style9">Frame</th>
                    <th class="auto-style3">FrameRate</th>
                    <th class="auto-style3">Bitrate</th>
                    <th class="auto-style3">Y-PSNR</th>
                    <th class="auto-style3">U-PSNR</th>
                    <th class="auto-style3">V-PSNR</th>
                    <th class="auto-style3">YUV-PSNR</th>
                    <th class="auto-style3">Total Second</th>
                    <th class="auto-style3">Output Image</th>
                    <th class="auto-style3">Config Files</th>
                    <th class="auto-style3">Analiz</th>
            </thead>
            <tbody>
                <asp:Repeater ID="rptTestData" runat="server" OnItemCommand="rptTestData_ItemCommand">


                    <ItemTemplate>
                            
                        <td><%# Eval("parameter") %> </a></td>
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
                            <img src='TestOutput/<%#Eval("output_image") %>' width="200"  style="cursor: pointer" onclick="return LoadDiv(this.src);"/>

                       </td>
                         <td>
                            <asp:Button runat="server" UseSubmitBehavior="false" CommandName="GoConfigFile" CommandArgument='<%# Eval("config_files") %>' ID="btnConfigFile" Text="Config Dosyası" />
                        </td>
                        <td>
                            <asp:Button runat="server" UseSubmitBehavior="false" CommandName="GoAnalysis" CommandArgument='<%# Eval("parameter") %>' ID="btnAnalysis" Text="Analiz" />
                        </td>
                        <tr class="active">
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>
             </center>
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
                            <input id="btnClose" type="button" value="Close" onclick="HideDiv()" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        &nbsp;
    </p>
         <!-- Image JS-->
    <script type="text/javascript" src="js/image_script.js"></script>
</asp:Content>

