<%@ Page Title="" Language="C#" MasterPageFile="~/ProductSite.Master" AutoEventWireup="true" CodeBehind="ProductDBPage.aspx.cs" Inherits="LabThree.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .column {
            font-family:'Bookman';
            font-size: large;
            text-align: center;
            font-weight: 400;
        }

        .auto-style2 {
            width: 204px;
        }

        .btn {
            border: 1px solid transparent;
            border-radius: 4px;
            padding-right: 25px;
        }

        .auto-style3 {
            font-family: 'Bookman';
            font-size: large;
            text-align: center;
            font-weight: 400;
            height: 49px;
        }
        .auto-style4 {
            width: 204px;
            height: 49px;
        }
        .auto-style5 {
            height: 49px;
        }
        .btn {
            height: 100%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align: center; padding-bottom: 15px;">PRODUCT PAGE</h1>
    <div style="width: 50%; margin: auto;">
    <table class="table table-bordered" >
        <tr>
            <td class="column">Product Id</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtId" CssClass="btn" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" CssClass="btn-sm btn-success" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn-sm" CausesValidation="False" />
                </td>
        </tr>
        <tr>
            <td class="auto-style3">Prodct Name</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtName" CssClass="btn" runat="server"></asp:TextBox>
            </td>
                        <td class="auto-style5">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" CssClass="btn-sm btn-info" Height="32px" Width="63px" />
                </td>
        </tr>
        <tr>
            <td class="column">Product Price:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPrice" CssClass="btn" runat="server"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtPrice" ErrorMessage="CompareValidator"
                    Operator="DataTypeCheck"
                    ForeColor="Red" Type="Currency">Price needs to be valid</asp:CompareValidator>
            </td>
                        <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn-sm btn-warning" />
            </td>
        </tr>
        <tr>
            <td class="column">Product Quantity:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtQuantity" CssClass="btn" runat="server" ValidationGroup="1"></asp:TextBox>
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="RangeValidator" MaximumValue="9999" MinimumValue="0" ForeColor="Red">Quantity needs to be in range from 0-9999</asp:RangeValidator>
            </td>
                        <td>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn-sm btn-danger" />
                </td>
        </tr>
    </table>
        <div style="text-align: center;">
                 <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <div style="text-align: center">
            </div>
    </div>
</asp:Content>
