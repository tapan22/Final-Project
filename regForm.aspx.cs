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

namespace StudentRetrieval
{
    public partial class regForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                clearform();
            }   
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                BL insert_user = new BL();
                DataTable buffer1 = insert_user.insert_user(Encrypt(tb_email.Text), Encrypt(tb_name.Text), Encrypt(tb_pass.Text), Encrypt(tb_num.Text), Encrypt(ddlseluser.SelectedItem.Text));
                DataTable buffer = insert_user.insert_dup_user(tb_email.Text, tb_name.Text, tb_pass.Text, tb_num.Text, ddlseluser.SelectedItem.Text);
                Response.Write("<script language='javascript'>window.alert('Registration Successfull');window.location='Login.aspx';</script>");
                clearform();
            }
            catch (Exception ze)
            {
                clearform();
                Response.Write("<script>alert('Email/Contact No. already exists')</script>");
            }
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

        public void clearform()
        {
            ddlseluser.SelectedIndex = 0;
            tb_cnpass.Text = null;
            tb_email.Text = null;
            tb_name.Text = null;
            tb_num.Text = null;
            tb_pass.Text = null;
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            clearform();
        }
    }
}

