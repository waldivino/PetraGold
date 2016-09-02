<%@ Page Title="" Language="C#" MasterPageFile="~/Views/_PetraGold.Master" AutoEventWireup="true" CodeBehind="FaleConosco.aspx.cs" Inherits="WebSitePetraGold.Views.FaleConosco" %>


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

    <script type="text/javascript">

        $(document).ready(function () {

        });

        function EnviarContato() {

            $('#btnEnviarContato').button('loading');

            var Nome = $('.nome').val();
            var Telefone = $('.telefone').val();
            var Email = $('.email').val();
            var AreaDeinteresse = $('.areaDeInteresse').val();
            var Mensagem = $('.mensagem').val();

            if (Nome.length < 5) {
                BootstrapDialog.show({
                    title: 'Informação',
                    message: 'Digite seu nome, mínimo 5 letras!',
                    buttons: [{
                        label: 'Entendi!',
                        cssClass: 'btn-primary',
                        action: function (dialogItself) {
                            dialogItself.close();
                            $('#btnEnviarContato').button('reset');
                            $('.nome').focus();
                        }
                    }]
                });
                
                return false;
            }

            if (Telefone.length < 12) {
                BootstrapDialog.show({
                    title: 'Informação',
                    message: 'Digite seu telefone corretamente!',
                    buttons: [{
                        label: 'Entendi!',
                        cssClass: 'btn-primary',
                        action: function (dialogItself) {
                            dialogItself.close();
                            $('#btnEnviarContato').button('reset');
                            $('.telefone').focus();
                        }
                    }]
                });
                Telefone.focus();
                return false;
            }

            if (Email.length < 6) {
                BootstrapDialog.show({
                    title: 'Informação',
                    message: 'Digite seu email corretamente!',
                    buttons: [{
                        label: 'Entendi!',
                        cssClass: 'btn-primary',
                        action: function (dialogItself) {
                            dialogItself.close();
                            $('#btnEnviarContato').button('reset');
                            $('.email').focus();
                        }
                    }]
                });
                Email.focus();
                return false;
            }

            if (Mensagem.length < 5) {
                BootstrapDialog.show({
                    title: 'Informação',
                    message: 'Digite uma mensagem com o mínimo de 5 letras!',
                    buttons: [{
                        label: 'Entendi!',
                        cssClass: 'btn-primary',
                        action: function (dialogItself) {
                            dialogItself.close();
                            $('#btnEnviarContato').button('reset');
                            $('.mensagem').focus();
                        }
                    }]
                });
                Mensagem.focus();
                return false;
            }

            $.ajax({
                //URL -> url de Envio da informações
                url: "FaleConosco.aspx/EnviarContato",

                //Type -> Qual o tipo de envio da informações
                type: "POST",

                //Content Type -> Tipo de Mensagem de conteudo
                contentType: "application/json; charset=utf-8",

                //Data Type -> Tipo da mensagem
                dataType: "json",

                //Data -> Parametros a serem enviados
                data: JSON.stringify({ 'Nome': Nome, 'Telefone': Telefone, 'Email': Email, 'AreaDeinteresse': AreaDeinteresse, 'Mensagem': Mensagem }),

                //Success -> Retorno com Sucesso do servidor
                success: function (data) {
                    // var html = ""

                    var json = $.parseJSON(data.d);

                    if (json.Info != "Error") {

                        BootstrapDialog.show({
                            title: 'Informação',
                            message: 'Contato enviado com sucesso!',
                            buttons: [{
                                label: 'Entendi!',
                                cssClass: 'btn-primary',
                                action: function (dialogItself) {
                                    dialogItself.close();
                                    $('.divContato').css('display', 'block');
                                    $('[data-toggle="tooltip"]').tooltip();
                                    $('#btnEnviarContato').button('reset');
                                    $(location).attr('href', 'Home.aspx');
                                }
                            }]
                        });
                    }
                    else {
                        BootstrapDialog.show({
                            title: 'Informação',
                            message: json.Message,
                            buttons: [{
                                label: 'Entendi!',
                                cssClass: 'btn-primary',
                                action: function (dialogItself) {
                                    dialogItself.close();
                                    $('#btnEnviarContato').button('reset');
                                }
                            }]
                        });
                    }
                },
                //Error -> Caso tenha erro no servidor apresento o erro
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    var json = $.parseJSON(XMLHttpRequest.responseText);

                    $('#menu1').removeClass("active");
                    $('#menu3').addClass("active");
                    $('#lblErro').html(json.Message);
                }
            });
        }

    </script>

</asp:Content>




<asp:Content ID="ContentBody" ContentPlaceHolderID="Conteudo" runat="server">

    <br />

    <div id="lblErro"></div>

    <div class="row">
        <div class="painelConteudo">
            <div class="form-horizontal" style="display: block;">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Fale com a Petra Gold</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">Nome:</label>
                        <div class="col-md-5">
                            <input id="nome" name="nome" type="text" placeholder="Digite seu nome" class="form-control input-md nome" required="" />
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="telefone">Telefone:</label>
                        <div class="col-md-4">
                            <input id="telefone" name="telefone" type="text" placeholder="Digite seu telefone" class="form-control input-md telefone" required="" />
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="email">Email:</label>
                        <div class="col-md-5">
                            <input id="email" name="email" type="text" placeholder="Digite o email" class="form-control input-md email" required="" />
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="areaDeInteresse">Área de interesse:</label>
                        <div class="col-md-4">
                            <select id="areaDeInteresse" name="areaDeInteresse" class="form-control areaDeInteresse">
                                <option value="Cambio">Câmbio</option>
                                <option value="Investimento">Investimento</option>
                            </select>
                        </div>
                    </div>

                    <!-- Textarea -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="mensagem">Mensagem:</label>
                        <div class="col-md-4">
                            <textarea class="form-control mensagem" id="mensagem" name="mensagem"></textarea>
                        </div>
                    </div>

                    <!-- Button (Double) -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="enviar"></label>
                        <div class="col-md-8">
                            <div id="containerButton">
                                <button
                                    type="button"
                                    id="btnEnviarContato"
                                    class="btn btn-success btn-lg"
                                    data-loading-text="Enviando o contato <i class='fa fa-refresh fa-spin'></i>"
                                    onclick="EnviarContato()">
                                    Enviar contato
                                </button>
                            </div>
                        </div>
                    </div>

                </fieldset>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.telefone').mask("+(00) (00) 0000-0000", { placeholder: "+(__) (__) ____-____" });
    </script>

</asp:Content>
