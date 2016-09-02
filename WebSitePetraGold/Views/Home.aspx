<%@ Page Title="" Language="C#" MasterPageFile="~/Views/_PetraGold.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebSitePetraGold.Views.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <%--<div class="jumbotron">
    </div>--%>

    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:100%; margin-left: 0%; margin-right: 0%;">
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
                <img src="/imagens/1a_pagina.jpg"" alt="Petra Gold" />
                <%-- <div class="carousel-caption">
                        <h3>Chania</h3>
                        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                    </div>--%>
            </div>

            <div class="item">
                <img src="/imagens/1a_pagina_2.jpg"" alt="Petra Gold">
                <%--<div class="carousel-caption">
                        <h3>Chania</h3>
                        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                    </div>--%>
            </div>

            <div class="item">
                <img src="/imagens/cambio.jpg" alt="Petra Gold" />
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
        <div class="col-md-4">

            <br />
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
                    <p>
                        <a class="btn" href="/Views/QuemSomos.aspx">Quem Somos »</a>
                    </p>
                </div>
            </div>
        </div>

        <br />
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>Câmbio</h3>
                </div>
                <div class="panel-body">
                    <p>
                        A Petra Gold está apta a atender às suas necessidades de câmbio nas seguintes modalidades:
                    </p>
                    <ul>
                        <li>Compra e venda de papel moeda – dólar, euro, libra, dólar australiano e mais outras dezenas de moedas</li>
                        <li>Remessa para residentes do exterior</li>
                        <li>Contratos de câmbio</li>
                    </ul>
                    <p>
                        Preencha o formulário de contato e um de nossos executivos irá lhe atender de forma eficiente.
                    </p>

                    <p>
                        <a class="btn" href="/Views/FaleConosco.aspx">Contato »</a>
                    </p>
                </div>
            </div>
        </div>

<%--        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>Notícias</h3>
                </div>
                <div class="panel-body">
                    <div id="info">--%>

                        <!--UOL Widgets - widgets.uol.com.br -->
                        <div class="UOLWidgetsStyle">
                            <script src="http://widgets.uol.com.br/uolwidgetstools.js?estacao=economia&tema=noticias&skin=1" type="text/javascript"></script>
                            <a href="http://economia.uol.com.br" target="_blank">http://economia.uol.com.br</a>
                        </div>
                        <!--//UOL Widgets-->

<%--                    </div>
                    <div id="info2"></div>

                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
