using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace StudentRetrieval
{
    public partial class input_mod : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                Load_Subject();
                Load_type();
                Load_diff_level();
            }
        }

        protected void btn_insert_Click(object sender, EventArgs e)
        {
            try
            {
           
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
                con.Open();
                BL ins_quest = new BL();
                bool insert = ins_quest.insert_questions(int.Parse(ddlSelSubject.SelectedItem.Value), int.Parse(tb_marks.Text), ddlSelQtype.SelectedItem.Value, tb_stem.Text, tb_a_stem.Text, int.Parse(ddlSelDifLevel.SelectedItem.Value), int.Parse(tb_module.Text));
                if (insert == true)
                    Response.Write("<script>alert('Question inserted successfully')</script>");
                else
                    Response.Write("Failure");
            
            }catch (Exception ex){
              Response.Write("Enter All Fields");
              clearmenu();  
            }
            
            clearmenu();
        }

        public void Load_Subject()
        {
            string constr = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(string.Format("SELECT sid,subject FROM tbl_branch ")))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlSelSubject.DataSource = cmd.ExecuteReader();
                    ddlSelSubject.DataTextField = "subject";
                    ddlSelSubject.DataValueField = "sid";
                    ddlSelSubject.DataBind();
                    con.Close();
                }
            }
            ddlSelSubject.Items.Insert(0, new ListItem("Select Subject", "0"));
        }

        public void Load_type()
        {
            string constr = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select distinct(type) from tbl_questions"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlSelQtype.DataSource = cmd.ExecuteReader();
                    ddlSelQtype.DataTextField = "type";
                    ddlSelQtype.DataValueField = "type";
                    ddlSelQtype.DataBind();

                    con.Close();
                }
            }
            ddlSelQtype.Items.Insert(0, new ListItem("Select Question Type", "0"));
        }

        public void Load_diff_level()
        {
            string constr = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select distinct(diff_level) from tbl_questions"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlSelDifLevel.DataSource = cmd.ExecuteReader();
                    ddlSelDifLevel.DataTextField = "diff_level";
                    ddlSelDifLevel.DataValueField = "diff_level";
                    ddlSelDifLevel.DataBind();

                    con.Close();
                }
            }
            ddlSelDifLevel.Items.Insert(0, new ListItem("Select Difficulty Level", "0"));
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            ddlSelSubject.SelectedIndex = 0;
            tb_a_stem.Text = null;
            tb_marks.Text = null;
            tb_module.Text = null;
            tb_stem.Text = null;
            ddlSelDifLevel.SelectedIndex = 0;
            ddlSelQtype.SelectedIndex = 0;
             
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        public void clearmenu()
        {
            ddlSelSubject.SelectedIndex = 0;
            tb_a_stem.Text = null;
            tb_marks.Text = null;
            tb_module.Text = null;
            tb_stem.Text = null;
            ddlSelDifLevel.SelectedIndex = 0;
            ddlSelQtype.SelectedIndex = 0;
        }

    }

}
