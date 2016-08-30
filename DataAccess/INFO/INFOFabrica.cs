using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.Common;

/// <summary>
/// Summary description for INFOFabrica
/// </summary>
public class INFOFabrica
{

    public DbCommand Comando { get; set; }
    public DbConnection Conexao { get; set; }
    public DbTransaction transaction { get; set; }


    public INFOFabrica()
    {
    }


    public DbDataReader SqlExeConsulta(INFOFabrica info)
    {
        var status = info.Conexao.State.ToString();

        if (status.Equals(ConnectionState.Closed.ToString()))
        {
            info.Conexao.Open();
            DbDataReader dr = info.Comando.ExecuteReader();
            return dr;
        }
        else
        {
            DbDataReader dr = info.Comando.ExecuteReader();
            return dr;
        }
    }

    public DbDataReader SqlExeConsultaPassandoQuery(INFOFabrica info, string query)
    {
         var status = info.Conexao.State.ToString();

         if (status.Equals(ConnectionState.Closed.ToString()))
         {
             info.Conexao.Open();
             info.Comando.CommandText = query;
             DbDataReader dr = info.Comando.ExecuteReader();
             return dr;
         }
         else
         {
             info.Comando.CommandText = query;
             DbDataReader dr = info.Comando.ExecuteReader();
             return dr;
         }
    }


    public void fncExecutarSQL(INFOFabrica info, string query)
    {
        var status = info.Conexao.State.ToString();

        if (status.Equals(ConnectionState.Closed.ToString()))
        {
            info.Conexao.Open();
            info.Comando.CommandText = query;
            info.Comando.ExecuteNonQuery();
            info.Conexao.Close();
        }
        if (status.Equals(ConnectionState.Open.ToString()))
        {
            info.Comando.CommandText = query;
            info.Comando.ExecuteNonQuery();
        }


    }

    public void fncExecutarSQLTransaction(INFOFabrica info, DbTransaction trans, string query)
    {
        var t = trans.Connection.State.ToString();
        info.Comando.Transaction = trans;
        info.Comando.CommandText = query;
        info.Comando.ExecuteNonQuery();
    }

    public int fncExecutarSQLReturnRows(INFOFabrica info, string query)
    {
        info.Conexao.Open();
        info.Comando.CommandText = query;
        int rows = info.Comando.ExecuteNonQuery();
        info.Conexao.Close();
        return rows;
    }


    public Int32 converteToInt32(string strGetOrdinal, DbDataReader dr)
    {
        Int32 campo = 0;

        try
        {
            string aux = dr.GetInt32(dr.GetOrdinal(strGetOrdinal)).ToString();
            campo = Convert.ToInt32(aux);
        }
        catch
        {
            string aux = dr.GetInt16(dr.GetOrdinal(strGetOrdinal)).ToString();
            campo = Convert.ToInt32(aux);
        }

        return campo;
    }

    public Int32 converteToInt32(int intGetOrdinal, DbDataReader dr)
    {
        Int32 campo = 0;

        try
        {
            string aux = dr.GetInt32(intGetOrdinal).ToString();
            campo = Convert.ToInt32(aux);
        }
        catch
        {
            string aux = dr.GetInt16(intGetOrdinal).ToString();
            campo = Convert.ToInt32(aux);
        }

        return campo;
    }

}