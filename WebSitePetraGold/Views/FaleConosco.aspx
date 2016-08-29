<%@ Page Title="" Language="C#" MasterPageFile="~/Views/_PetraGold.Master" AutoEventWireup="true" CodeBehind="FaleConosco.aspx.cs" Inherits="WebSitePetraGold.Views.FaleConosco" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {

            //if (radioAr.checked) {
            //    txtAR.disabled = false;
            //    txtRenach.disabled = true;
            //    txtPedido.disabled = true;
            //    txtLote.disabled = true;
            //    $('#TextAR').focus();
            //}

        });

        function EnviarContato() {

            $.ajax({
                //URL -> url de Envio da informações
                url: "Views/FaleConosco.aspx/EnviarContato",

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

                        $('.divContato').append(html);

                        BootstrapDialog.show({
                            title: 'Informação',
                            message: 'Contato enviado com sucesso!',
                            buttons: [{
                                label: 'Entendi!',
                                cssClass: 'btn-primary',
                                action: function (dialogItself) {
                                    dialogItself.close();
                                    $('.btnEnviarContato').button('reset');
                                    $('.divContato').css('display', 'block');
                                    $('[data-toggle="tooltip"]').tooltip();
                                    $('.btnEnviarContato').button('reset');
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
                                    $('.btnEnviarContato').button('reset');
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

    <br />

    <div id="lblErro"></div>

    <div class="form-horizontal divContato" style="display: block;">
        <fieldset>

            <!-- Form Name -->
            <legend>Fale com a Petra Gold</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="nome">Nome:</label>
                <div class="col-md-5">
                    <input id="nome" name="nome" type="text" placeholder="Digite seu nome" class="form-control input-md" required="">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="telefone">Telefone:</label>
                <div class="col-md-4">
                    <input id="telefone" class="telefone" name="telefone" type="text" placeholder="Digite seu telefone" class="form-control input-md" required="">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="email">Email:</label>
                <div class="col-md-5">
                    <input id="email" name="email" type="text" placeholder="Digite o email" class="form-control input-md" required="">
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="areaDeInteresse">Área de interesse:</label>
                <div class="col-md-4">
                    <select id="areaDeInteresse" name="areaDeInteresse" class="form-control">
                        <option value="Cambio">Câmbio</option>
                        <option value="Investimento">Investimento</option>
                    </select>
                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="mensagem">Mensagem:</label>
                <div class="col-md-4">
                    <textarea class="form-control" id="mensagem" name="mensagem"></textarea>
                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="enviar"></label>
                <div class="col-md-8">
                    <div id="btnEnviarContatos">
                            <button
                                type="button"
                                id="btnEnviarContato"
                                class="btn btn-success btn-lg"
                                data-loading-text="Enviando o contato <i class='fa fa-refresh fa-spin'></i>"
                                onclick="EnviarContato()">
                                Enviar contato
                            </button>
                        </div>
                    <button id="cancelar" name="cancelar" class="btn btn-danger">Cancelar</button>
                </div>
            </div>

        </fieldset>
    </div>

    <script type="text/javascript">
        $('.telefone').mask("+(00) (00) 0000-0000", { placeholder: "+(__) (__) ____-____" });
    </script>

</asp:Content>
