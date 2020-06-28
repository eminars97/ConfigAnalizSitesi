<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Config_Parameters.aspx.cs" Inherits="Config_Parameters" %>

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
        .mydropdownlist {
            position: absolute;
            top: 9%;
            right: 50%;
            color: white;
            font-size: 20px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: gray;
            font-weight: bold;
            /*#cc2a41*/
        }
        .label{
            color: darkred;
            padding: 8px;
            font-family: Arial;
            position: absolute;
            top: 7.5%;
            left: 60%;
        }
    </style>
  
    <link href="css/Tasarim.css" rel="stylesheet" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
       
    <div class="row">
        <div class="col-2">
             <asp:Label ID="lblCount" CssClass="label" runat="server" Text="Label"></asp:Label>
           
            <br />
            <br />
            <br />
        </div>
        <div class="col-6">
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="mydropdownlist" onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="tag" DataValueField="tag">
            </asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SV_Config_AnalysisConnectionString2 %>" SelectCommand="SELECT DISTINCT [tag] FROM [config_parameters]"></asp:SqlDataSource>
            
            <asp:TextBox ID="TextBox1" runat="server" > </asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFilter" runat="server" Text="Ara" OnClick="btnFilter_Click"/>
           
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
                    <th class="auto-style12">Parameter</th>
                    <th class="auto-style7">Açılımı</th>
                    <th class="auto-style9">Default Değer</th>
                    <th class="auto-style3">Açıklama</th>
                    <th class="auto-style3">Test Sonuçları</th>
                    
                  
            </thead>
            <tbody>
                <asp:Repeater ID="rptConfigParam" runat="server" OnItemCommand="rptConfigParam_ItemCommand">
                    <ItemTemplate>
                        <tr>
                        <td><%# Eval("parameter") %> </td>
                        <td><%# Eval("evolution") %> </td>
                        <td><%# Eval("default_value") %></td>
                        <td><%# Eval("description") %></td>
                        <td>
                            <asp:Button runat="server" UseSubmitBehavior="false" CommandName="GoTestOutput" CommandArgument='<%# Eval("id") %>' ID="btnTestOutput" Text="Sonuca Git" />
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

