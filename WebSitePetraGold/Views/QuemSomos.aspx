<%@ Page Title="" Language="C#" MasterPageFile="~/Views/_PetraGold.Master" AutoEventWireup="true" CodeBehind="QuemSomos.aspx.cs" Inherits="WebSitePetraGold.Views.QuemSomos" %>



<asp:Content ID="ContentHeader" ContentPlaceHolderID="head" runat="server">


    <link href="../css/bootstrap.css" rel="stylesheet">
    <%-- <link href="../css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style2.css" rel="stylesheet">
    <link href="../css/bootstrap-dialog.css" rel="stylesheet" />
    <link href="../css/font-awesome.css" rel="stylesheet" />

    <script src="../js/jquery-1.10.2.js"></script>

    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-dialog.js"></script>
    <script src="../js/jquery.mask.js"></script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">



    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <%--<li data-target="#myCarousel" data-slide-to="3"></li>--%>
        </ol>



        <!-- Wrapper for slides -->
        <div class="carousel-inner imagensCarousel" role="listbox">
            <div class="item active">
                <img src="/imagens/paisagem_2.jpg" alt="Petra Gold" />
                <%-- <div class="carousel-caption">
                        <h3>Chania</h3>
                        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                    </div>--%>
            </div>

            <div class="item">
                <img src="/imagens/escritorio.jpg" alt="Petra Gold">
                <%--<div class="carousel-caption">
                        <h3>Chania</h3>
                        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                    </div>--%>
            </div>

            <div class="item">
                <img src="/imagens/índice.jpg" alt="Petra Gold" />
                <%--<div class="carousel-caption">
                        <h3>Flowers</h3>
                        <p>Beatiful flowers in Kolymbari, Crete.</p>
                    </div>--%>
            </div>

            <%--<div class="item">
                <img src="img_flower2.jpg" alt="Flower">
                <div class="carousel-caption">
                    <h3>Flowers</h3>
                    <p>Beatiful flowers in Kolymbari, Crete.</p>
                </div>
            </div>--%>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only"><<<</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">>>></span>
        </a>
    </div>

    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>Quem Somos</h3>
            </div>
            <div class="panel-body">
                <p>
                    A Petra Gold Câmbio e Investimentos está localizada no coração do centro financeiro do Rio de Janeiro e atua na área de serviços financeiros para pessoas físicas e jurídicas.
Através de nossos parceiros e profissionais, atuamos com integridade e comprometimento nos diversos segmentos do mercado, como contratos de câmbio, remessa para pessoas físicas, papel moeda e outros produtos financeiros.
Nossa equipe comercial está disponível para apresentar as soluções mais adequadas ao seu perfil.
Entre em contato agora mesmo através do nosso formulário e um executivo de contas irá lhe atender de forma personalizada.
                </p>
            </div>
        </div>

    </div>
</asp:Content>
