<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Train.aspx.cs" Inherits="Train_Railway.Train" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="css/Style.css" rel="stylesheet" />
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <p>
            <br />
        </p>
        <asp:Panel ID="Panel2" runat="server" BackColor="#0099FF">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="TrainTable">
                <%--A label Text of Available Trains--%>
                    <%--A table that shows the available Trains Trips--%>
                        <asp:Label ID="Label2" runat="server" Text="Available Trains:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="309px" Width="597px" BackColor="White" BorderColor="#33CCFF" BorderStyle="Solid" CssClass="TrainTable">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="From" HeaderText="From" SortExpression="From" />
                                <asp:BoundField DataField="To" HeaderText="To" SortExpression="To" />
                                <asp:BoundField DataField="Leaving" HeaderText="Leaving" SortExpression="Leaving" />
                                <asp:BoundField DataField="Arriving" HeaderText="Arriving" SortExpression="Arriving" />
                                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Trains]"></asp:SqlDataSource>
            </div>
            <br />

            <div class="BookedTable">
                <%-- A table that shows the booked trips--%>
                    <%--A lable of Booked Trips--%>
                        <asp:Label ID="Label3" runat="server" Text="Booked Trips:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="175px" Width="602px" BackColor="White" BorderColor="#33CCFF" BorderStyle="Solid" CssClass="BookedTable">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="TrainName" HeaderText="TrainName" SortExpression="TrainName" />
                                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                                <asp:BoundField DataField="Leaving" HeaderText="Leaving" SortExpression="Leaving" />
                                <asp:BoundField DataField="Arriving" HeaderText="Arriving" SortExpression="Arriving" />
                                <asp:BoundField DataField="Trip" HeaderText="Trip" SortExpression="Trip" />
                                <asp:BoundField DataField="PassengerName" HeaderText="PassengerName" SortExpression="PassengerName" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Booking]"></asp:SqlDataSource>
            </div>
            <br />

            <%-- A panel that holds the Tiket and its holder information + Trips info--%>
        </asp:Panel>
        <p>
        </p>
        <p>
            <asp:Panel ID="Panel1" runat="server" BackColor="#66FF66">
                &nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="National ID:"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* ID should be 10 digits" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Age:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Age between 15-80" ForeColor="Red" MaximumValue="80" MinimumValue="15"></asp:RangeValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Train ID:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="OK" />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="264px" Width="365px"></asp:ListBox>
                <br />
                <br />
                <br />
                <br />
            </asp:Panel>
    </asp:Content>