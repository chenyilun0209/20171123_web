using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace ezapp
{
    public class connString
    {
        public static string ConnectionString()
        {
            //string str_Connection = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            string str_Connection = WebConfigurationManager.ConnectionStrings["dbconn2"].ConnectionString;
            return str_Connection;
        }
    }
}