using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace StudentRetrieval
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!this.IsPostBack)
            {
                ClearQPAS();
                Load_Subject();
                Load_diff_level();
                ddlqcount.Items.Insert(0, new ListItem("Select Questions", "0"));
                ddlModuleCnt.Items.Insert(0, new ListItem("Select Module", "0"));
            }  
         }

        public void Load_Subject()
        {
            string constr = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                //string sql = string.Format("SELECT * FROM tbl_branch WHERE branch='{0}'", branch);
                using (SqlCommand cmd = new SqlCommand(string.Format("SELECT distinct(subject) FROM tbl_branch ")))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlSelSubject.DataSource = cmd.ExecuteReader();
                    ddlSelSubject.DataTextField = "subject";
                    ddlSelSubject.DataValueField = "subject";
                    ddlSelSubject.DataBind();
                    con.Close();
                }
            }
            ddlSelSubject.Items.Insert(0, new ListItem("Select Subject", "0"));
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
            ddlSelDifLevel.Items.Insert(0, new ListItem("Select Difficulty Level", "-1"));
        }

        protected void btn_check_avail_Click(object sender, EventArgs e)
        {
            try
            {
                ddlqcount.Items.Clear();
                BL getcount = new BL();

                DataSet ds1 = null;
                ds1 = getcount.get_count(ddlSelSubject.SelectedIndex, ddlSelQtype.SelectedItem.Text, int.Parse(ddlSelDifLevel.SelectedItem.Text), int.Parse(tb_marks.Text), int.Parse(tb_sel_mod.Text));
                Label_avail.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]) + " Questions Are Available";
                // ddlqcount.Items.Insert(0, new ListItem("Select", "0"));
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    for (int i = 1; i <= int.Parse(Convert.ToString(ds1.Tables[0].Rows[0][0])); i++)
                    {
                        ddlqcount.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    }
                }
                else
                {
                    Label_avail.Text = " 0 Questions Are Available";
                }

                ddlqcount.Items.Insert(0, new ListItem("Select number of questions", "0"));
                tb_sel_mod.Attributes.Add("max", ddlModuleCnt.SelectedItem.Text);
                Label_avail.Visible = true;
            }
            catch (Exception ez)
            {
                Response.Write("Enter All Fields");
            }
            
        }

        protected void add_questions_Click(object sender, EventArgs e)
        {
            try
            {
                display_grid();

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO QPAS(Qid,Sid,Marks,Type,Question,Answer,Diff_Level,Module,Part)values('" + int.Parse(GridView1.Rows[i].Cells[0].Text) + "','" + int.Parse(GridView1.Rows[i].Cells[1].Text) + "','" + int.Parse(GridView1.Rows[i].Cells[2].Text) + "','" + GridView1.Rows[i].Cells[3].Text + "','" + GridView1.Rows[i].Cells[4].Text + "','" + GridView1.Rows[i].Cells[5].Text + "','" + int.Parse(GridView1.Rows[i].Cells[6].Text) + "','" + int.Parse(GridView1.Rows[i].Cells[7].Text) + "','" + int.Parse(GridView1.Rows[i].Cells[8].Text) + "')", con);
                    int ret = cmd.ExecuteNonQuery();
                    if (ret == 1)
                    {
                        Label_add.Visible = true;
                        Label_add.Text = ddlqcount.SelectedItem.Text+" Questions Added";
                    }
                    con.Close();
                }
                lbl_totmarks.Text = tb_total_marks.Text;
                BL getSum = new BL();
                DataTable buffer = getSum.GetSumMarks();
                lbl_SelMarks.Text = buffer.Rows[0][0].ToString();
                lbl_RemMarks.Text = (int.Parse(tb_total_marks.Text) - int.Parse(lbl_SelMarks.Text)).ToString();
                ddlSelQtype.SelectedIndex = 0;
                ddlSelPart.SelectedIndex = 0;
                ddlSelDifLevel.SelectedIndex = 0;
                tb_marks.Text = null;
                tb_sel_mod.Text = null;
                if ((int.Parse(lbl_SelMarks.Text)) == (int.Parse(tb_total_marks.Text)))
                {
                    btn_redirect.Visible = true;
                    btn_answer.Visible = true;
                }
            }
            catch (Exception ez)
            {
                Response.Write("Enter All Fields");
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            for (int i = 1; i <= int.Parse(ddlModuleCnt.SelectedItem.Text); i++)
            {
                tb_sel_mod.Attributes.Add("max", i.ToString());
            }
            tb_to_be_answ.Attributes.Add("max", tb_total_quest.Text);
            Load_Type();
           
        }

        public void Load_Default_Values()
        {
            //  ddlSelSubject.SelectedItem.Text = "Operating System";
            tb_total_quest.Text = "1";
            tb_to_be_answ.Text = "2";
            tb_total_marks.Text = "100";
            tb_sel_mod.Text = "1";
            ddlModuleCnt.SelectedItem.Text = "5";
            ddlSelPart.SelectedItem.Text = "1";
            tb_no_of_ques_mod.Text = "4";
            ddlSelPart.SelectedItem.Text = "1";
            //ddlSelQtype.SelectedItem.Text = "Theory";
            tb_marks.Text = "8";
            tb_module_marks.Text = "16";
            ddlSelDifLevel.SelectedItem.Text = "1";

        }

        public void display_grid()
        {
            try
            {
                BL add = new BL();
                DataSet ds1 = new DataSet();
                int no_ques = int.Parse(tb_no_of_ques_mod.Text);
                ds1 = add.add_questions(int.Parse(ddlqcount.SelectedItem.Text), ddlSelSubject.SelectedIndex, int.Parse(tb_sel_mod.Text), ddlSelQtype.SelectedItem.Text, int.Parse(tb_marks.Text), int.Parse(ddlSelDifLevel.SelectedItem.Text));
                //ds1 = add.Grid_Display(int.Parse(ddlqcount.SelectedItem.Text), int.Parse(tb_sel_mod.Text), ddlSelQtype.SelectedItem.Text, int.Parse(tb_marks.Text), int.Parse(ddlSelDifLevel.SelectedItem.Text));
                ds1.Tables[0].Columns.Add("Part", typeof(int));
                for (int i = 0; i <= ds1.Tables[0].Rows.Count - 1; i++)
                {
                    ds1.Tables[0].Rows[i]["Part"] = ddlSelPart.SelectedItem.Text;
                }
                GridView1.DataSource = ds1;
                //GridView1.Columns[0].Visible = false;
                //GridView1.Columns[1].Visible = false;
                GridView1.DataBind();
                

            }
            catch (Exception ez)
            {
                Response.Write(ez.ToString());
            }

        }
        #region Load Labels
        public void labelLoad()
        {
            Label_Subject.Text = ddlSelSubject.SelectedItem.Text;
            Label_total_quest.Text = tb_total_quest.Text;
            Label_tot_marks.Text = tb_total_marks.Text;
            Label_mod_cnt.Text = ddlModuleCnt.SelectedItem.Text;
            Label_sel_mod.Text = tb_sel_mod.Text;
            Label_no_of_mod_ques.Text = tb_no_of_ques_mod.Text;
            Label_part.Text = ddlSelPart.SelectedItem.Text;
            Label_q_type.Text = ddlSelQtype.SelectedItem.Text;
            Label_marks.Text = tb_marks.Text;
            Label_marks_for_module.Text = tb_module_marks.Text;
            Label_diff_level.Text = ddlSelDifLevel.SelectedItem.Text;
            Label_ques_count.Text = ddlqcount.Text;

        }
        #endregion

        #region Load Type
        public void Load_Type()
        {
            BL temp = new BL();
            DataSet ds = null;
            ds = temp.load_type(ddlSelSubject.SelectedIndex);
            ddlSelQtype.DataTextField = "type";
            ddlSelQtype.DataValueField = "type";
            ddlSelQtype.DataSource = ds;
            ddlSelQtype.DataBind();
            ddlSelQtype.Items.Insert(0, new ListItem("Select Question Type", "0"));
        }
        #endregion

        #region Redirect To Question Report
        protected void btn_redirect_Click(object sender, EventArgs e)
        {
            if ((int.Parse(lbl_SelMarks.Text)) == (int.Parse(tb_total_marks.Text)))
            {
                Response.Write("<script>");
                Response.Write("window.open('Report.aspx','_blank')");
                Response.Write("</script>"); 
                //Response.Redirect("Report.aspx", '_blank');
            }
            else
            {
                Response.Write("Marks Distribution not Equal");
            }
        }
        #endregion

        #region Clear QPAS
        public void ClearQPAS()
        {
            BL DeleteQPAS = new BL();
            DataTable buffer = DeleteQPAS.DeleteQPAS();
        }
        #endregion

        protected void btn_answer_Click(object sender, EventArgs e)
        {
            if ((int.Parse(lbl_SelMarks.Text)) == (int.Parse(tb_total_marks.Text)))
            {
                Response.Write("<script>");
                Response.Write("window.open('Ans_report.aspx','_blank')");
                Response.Write("</script>");
                //Response.Redirect("Report.aspx", '_blank');
            }
            else
            {
                Response.Write("Marks Distribution not Equal");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}
 