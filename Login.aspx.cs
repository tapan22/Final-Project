using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Net;
using System.Collections.Specialized;


namespace StudentRetrieval
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            BL p = new BL();
            if (p.IsValid(uname.Text, pass.Text) == true)
            {
                Session["UN"] = uname.Text;
                Session["PW"] = pass.Text;

                DataTable buffer = p.GetTypeofUser(uname.Text);
                //lblUserType.Text = buffer.Rows[0][0].ToString();

                if (buffer.Rows[0][0].ToString() == "Administrator")
                    //Response.Redirect("qform.aspx");
                    Response.Write("<script language='javascript'>window.alert('You have logged in as an administrator. Please choose the next module');window.location='qform.aspx';</script>");
                else if (buffer.Rows[0][0].ToString() == "Question Inputter")
                    //Response.Redirect("input_mod.aspx");
                    Response.Write("<script language='javascript'>window.alert('You have logged in as a question inputter. Redirecting to input module');window.location='input_mod.aspx';</script>");
                else if (buffer.Rows[0][0].ToString() == "Question Retriever")
                    //Response.Redirect("Retrieval.aspx");
                    Response.Write("<script language='javascript'>window.alert('You have logged in as a question retriever. Redirecting to retrieval module');window.location='Retrieval.aspx';</script>");
                uname.Text = null;
            }
            else
                Response.Write("<script>alert('Invalid user')</script>");
                uname.Text = null;
        }

        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("regForm.aspx");
        }

    }
}
        