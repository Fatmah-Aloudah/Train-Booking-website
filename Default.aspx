<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Train_Railway.Default" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="css/Style.css" rel="stylesheet" />
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="train">
            <h1>AMTRAK</h1>
            <img src="img/train.jpg" />
            <p>The fastest train in the area</p>
        </div>
    </asp:Content>