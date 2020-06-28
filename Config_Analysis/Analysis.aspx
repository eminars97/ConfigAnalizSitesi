<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Analysis.aspx.cs" Inherits="Analysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        input[type=text] {
            position: absolute;
            top: 6%;
            left: 50%;
            transform: translate(-50%,50%);
            background: #FFFFFF;
            height: 40px;
            border-radius: 40px;
            padding: 0 6px;
        }
    </style>

    <link href="css/Tasarim.css" rel="stylesheet" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
       
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
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SV_Config_AnalysisConnectionString %>" SelectCommand="SELECT DISTINCT [tag] FROM [config_parameters]"></asp:SqlDataSource>
        </div>
        <div class="col-4">
        </div>
    </div>
    
       <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <table class="auto-style1" border="1" id="l">
            <thead>
                <tr class="warning">
                    <th class="auto-style12">Parametre</th>
                    <th class="auto-style7">Analiz</th>
                    <th class="auto-style7">Tanım</th>
                    <th class="auto-style7">Test</th>
                  
            </thead>
            <tbody>
                <asp:Repeater ID="rptAnalysis" runat="server" OnItemCommand="rptAnalysis_ItemCommand">
                    <ItemTemplate>
                        <tr>
                        <td><%# Eval("parameter") %> </td>
                        <td><%# Eval("analysis") %> </td>
                        <td>
                            <asp:Button runat="server" UseSubmitBehavior="false" CommandName="GoConfigParam" CommandArgument='<%# Eval("id") %>' ID="Button1" Text="Tanıma Git" />
                        </td>
                        <td>
                            <asp:Button runat="server" UseSubmitBehavior="false" CommandName="GoTestOutput" CommandArgument='<%# Eval("id") %>' ID="btnTestOutput" Text="Teste Git" />
                        </td>
                            </tr>
                    </ItemTemplate>
                </asp:Repeater>
               
            </tbody>
        </table>
             </center>
        </div>
         
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

