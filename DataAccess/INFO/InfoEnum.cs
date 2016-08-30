using System;
using System.Data;
using System.Web;
using System.ComponentModel;
using System.Configuration;

/// <summary>
/// Summary description for InfoEnum
/// </summary>
public class InfoEnum
{
    // Obtenho do web.config a string de conexao
    public static string stringConexao = "server=localhost;database=petragold;uid=root;server=localhost;database=petragold;uid=root;pwd='100988'";

    public enum StatusRemoto
	{
		APLICACAOONLINE = 1,
		APLICACAOOFFLINE = 2
	}

}
