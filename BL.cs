using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace StudentRetrieval
{
    public class BL
    {
        #region Declarations
        SqlConnection con = null;
        SqlCommand cmd = null;
        DataSet ds;
        #endregion

        #region Constructor to make connection
        public BL()
        {
            //con = new SqlConnection("server=NTS-TECH-4;database=NOE;User id=sa;Pwd=sql");
            string cs = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
        }
        #endregion

        
        #region To Fetch Questions
        public DataSet add_questions(int cnt, int sid, int module,string type,int marks, int diff_level)
        {
            ds = new DataSet();
            string sql = string.Format("spAllCombinations {0},{1},{2},'{3}',{4},{5}", cnt, sid, module, type, marks, diff_level);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            adap.Fill(ds, "Add Questions");
            return ds;
        }
        #endregion

        #region To Fetch Questions To Diplay In Grid
        public DataSet Grid_Display(int cnt, int module, string type, int marks, int diff_level)
        {
            ds = new DataSet();
            string sql = string.Format("spToDisplayInGrid {0},{1},'{2}',{4},{5}", cnt,  module, type, marks, diff_level);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            adap.Fill(ds, "Add Questions");
            return ds;
        }
        #endregion

        #region To Insert Questions
        public bool insert_questions(int sid, int marks, string type, string question, string answer, int diff_level, int module)
        {
            


            try
            {
                string sql = string.Format("INSERT INTO tbl_questions VALUES ({0},{1},'{2}','{3}','{4}',{5},{6})",
                    sid,
                    marks,
                    type,
                    question,
                    answer,
                    diff_level,
                    module
                    );
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException e)
            {
                return false;
            }
        }
        #endregion

        #region Load Type
        public DataSet load_type(int sid)
        {
            ds = new DataSet();
            string sql = string.Format("sp_load_type {0}", sid);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            adap.Fill(ds, "Type");

            return ds;
        }
        #endregion
        
        #region Get Count
        public DataSet get_count(int sid,String type,int diff_level,int marks,int module)
        {
            ds = new DataSet();
            string sql = string.Format("sp_get_count {0},'{1}',{2},{3},{4}", sid,type,diff_level,marks,module);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            adap.Fill(ds, "Count");

            return ds;
        }
        #endregion

        #region To Get Sum of Marks Data Table
        public DataTable GetSumMarks()
        {
            string sql = string.Format("sp_GetMarksSumQPAS");
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        #endregion

        #region To Insert Dup User Details
        public DataTable insert_dup_user(string email,string username,string pass,string phone,string user_type)
        {
            string sql = string.Format("sp_insert_dup_user_details '{0}','{1}','{2}','{3}','{4}'", email, username, pass, phone, user_type);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        #endregion

        #region To Insert User Details
        public DataTable insert_user(string email, string username, string pass, string phone, string user_type)
        {
            string sql = string.Format("sp_insert_user_details '{0}','{1}','{2}','{3}','{4}'", email, username, pass, phone, user_type);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        #endregion

        #region Delete QPAS
        public DataTable DeleteQPAS()
        {
            string sql = string.Format("clear_qpas");
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        #endregion

        #region using datatable for type of user
        public DataTable GetTypeofUser(string email)
        {
            string sql = string.Format("sp_Check '{0}'", email);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        #endregion

        #region Check Validity
        public bool IsValid(string EmailId, string Password)
        {
            string sql = string.Format("Select count(*) from dup_user_1 where email = '{0}' and password = '{1}'", EmailId, Password);
            cmd.CommandText = sql;
            return int.Parse(cmd.ExecuteScalar().ToString()) == 0 ? false : true;
        }
        #endregion

    }
}