using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;

public class ConnectionFactory
{
    public ConnectionFactory() { }

    public static INFOFabrica GetConnection()
    {

        try
        {
            return MySqlFactory.objetoConexao();
        }
        catch
        {
            throw;
        }

    }

}