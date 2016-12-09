using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace BreweryBucketList
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            //Create the msg object to be sent
            
            MailMessage mail = new MailMessage(txtSenderEmail.Text, "brewerybucketlist@gmail.com", ddlSubject.SelectedValue, txtMessage.Text);
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.Credentials = new System.Net.NetworkCredential("brewerybucketlist@gmail.com", "BreweryBucketList1");
            client.EnableSsl = true;
            client.Send(mail);
            
            
            try
            {
                client.Send(mail);
                string message = "Your email was sent successfully.";
                MsgBox(message);
                txtSenderName.Text = "";
                txtMessage.Text = "";
                txtSenderEmail.Text = "";
                ddlSubject.SelectedValue = "-Select-";

            }
            catch (Exception ep)
            {                
                lblResult.Text = "Your email message failed to send message!";
                MsgBox(ep.Message);
            }

                    
        }   
        
        public void MsgBox(string msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language ='javascript'>alert('" + msg + "')</script>");
        }

    }
}