using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Net.Mail;
//using System.Net;
using EASendMail;

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
            SmtpMail oMail = new SmtpMail("TryIt");
            SmtpClient oSmtp = new SmtpClient();

            //Add your email address to the recipients
            oMail.From = txtSenderEmail.Text;

            //Add your email address to the recipients
            oMail.To = "brewerybucketlist@gmail.com";
            
            // Set subject
            oMail.Subject = ddlSubject.SelectedValue;
            
            // set email body 
            oMail.TextBody = txtMessage.Text; 

            SmtpServer oServer = new SmtpServer("smtp.gmail.com");

            oServer.Port = 465;

            oServer.ConnectType = SmtpConnectType.ConnectSSLAuto;
            
            oServer.User = "brewerybucketlist@gmail.com";
            oServer.Password = "CraftBeer19";

            try
            {
                oSmtp.SendMail(oServer, oMail);
                lblResult.Text = "Your email was sent successfully.";
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

            lblResult.Text = "";

            
        }   
        
        public void MsgBox(string msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language ='javascript'>alert('" + msg + "')</script>");
        }

    }
}