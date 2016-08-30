using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OracleFactory
/// </summary>
public class MySqlFactory
{
    private static List<INFOFabrica> connectOpens = new List<INFOFabrica>();
    private static INFOFabrica info = new INFOFabrica();

    private MySqlConnection bdConn; //MySQL
    private MySqlDataAdapter bdAdapter;
    private DataSet bdDataSet; //MySQL

    public MySqlFactory()
    {

    }

    public static INFOFabrica objetoConexao()
    {

        info = new INFOFabrica();
        info.Conexao = new MySqlConnection();
        info.Conexao.ConnectionString = InfoEnum.stringConexao.ToString();
        info.Comando = info.Conexao.CreateCommand();
        return info;

    }

    public static INFOFabrica objetoConexaoComTransacao()
    {

        info = new INFOFabrica();
        info.Conexao = new MySqlConnection();
        info.Conexao.ConnectionString = InfoEnum.stringConexao;
        info.Comando = info.Conexao.CreateCommand();

        return info;
    }

}