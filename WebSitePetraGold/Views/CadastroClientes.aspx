<%@ Page Title="" Language="C#" MasterPageFile="~/Views/_PetraGold.Master" AutoEventWireup="true" CodeBehind="CadastroClientes.aspx.cs" Inherits="WebSitePetraGold.Views.CadastroClientes" %>


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

        function CadastroCliente() {

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
                    <legend>Cadastro de Cliente</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">Nome:</label>
                        <div class="col-md-5">
                            <input id="nome" name="nome" placeholder="Digite seu nome completo" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="endereco">Enderço:</label>
                        <div class="col-md-6">
                            <input id="endereco" name="endereco" placeholder="Logradouro, número e complemento" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="telefoneFixo">Telefone fixo:</label>
                        <div class="col-md-4">
                            <input id="telefoneFixo" name="telefoneFixo" placeholder="Digite seu telefone fixo" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="celular">Celular:</label>
                        <div class="col-md-4">
                            <input id="celular" name="celular" placeholder="Digite seu celular" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="cpf">Cpf:</label>
                        <div class="col-md-4">
                            <input id="cpf" name="cpf" placeholder="Digite seu cpf" class="form-control input-md" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="identidade">Identidade:</label>
                        <div class="col-md-4">
                            <input id="identidade" name="identidade" placeholder="Digite sua identidade" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nacionalidade">Nacionalidade:</label>
                        <div class="col-md-4">
                            <input id="nacionalidade" name="nacionalidade" placeholder="Digite sua nacionalidade" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="dataNascimento">Data Nascimento:</label>
                        <div class="col-md-4">
                            <input id="dataNascimento" name="dataNascimento" placeholder="00/00/0000" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="naturalidade">Naturalidade:</label>
                        <div class="col-md-4">
                            <input id="naturalidade" name="naturalidade" placeholder="Digite sua naturalidade" class="form-control input-md" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="email">Email</label>
                        <div class="col-md-5">
                            <input id="email" name="email" placeholder="Digite seu email" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="usuario">Usuario:</label>
                        <div class="col-md-4">
                            <input id="usuario" name="usuario" placeholder="Digite seu usuario" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="senha">Senha:</label>
                        <div class="col-md-4">
                            <input id="senha" name="senha" placeholder="Digite sua senha" class="form-control input-md" required="" type="text"/>
                        </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="btnCadastrar"></label>
                        <div class="col-md-4">
                            <button id="btnCadastrar" name="btnCadastrar" class="btn btn-primary">Cadastrar</button>
                        </div>
                    </div>

                </fieldset>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#telefoneFixo').mask("+(00) (00) 0000-0000", { placeholder: "+(__) (__) ____-____" });
        $('#celular').mask("+(00) (00) 0000-0000", { placeholder: "+(__) (__) ____-____" });
        $('#cpf').mask("000.000.000-00", { placeholder: "000.000.000-00" });
        $('#dataNascimento').mask("00/00/0000", { placeholder: "00/00/0000" });
    </script>


</asp:Content>
