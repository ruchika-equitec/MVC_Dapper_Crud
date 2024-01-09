using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;
using System.Data.SqlClient;
namespace RuchikaMVCCrud.Models
{
    public static class StudDapOrm
    {
        private readonly static string connectionString = @"Data Source=192.168.1.4 ; Initial Catalog=RuchikaMVCDapperDB ;  uid=sa; Password=123";
        public static void ExecuteWithoutReturn(string procedureName, DynamicParameters param=null)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                con.Execute(procedureName, param,commandType:CommandType.StoredProcedure);
            }
        }
        //used to execute stored procedure  
        public static T ExecuteReturnScalar<T>  (string procedureName, DynamicParameters param=null)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                return (T) Convert.ChangeType( con.ExecuteScalar (procedureName, param, commandType: CommandType.StoredProcedure),typeof(T));
            }
        }
        public static IEnumerable<T> ReturnList<T>(string procedureName, DynamicParameters param=null)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                return con.Query<T>(procedureName, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}