using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Text.RegularExpressions;

namespace user_login
{
    public partial class Register : Form
    {
        Thread th;
        public Register()
        {
            InitializeComponent();
        }

        User user = new User();


        List<User> Ulist = new List<User>();
        private void Button1_Click(object sender, EventArgs e)
        {
          
          
           
           
            user.Password = kod.Text;
            string onlyLetters = @"^[a-zA-Z]+$";
            //validation name
            Regex uname = new Regex(onlyLetters);        
            Match unameMatch = uname.Match(textBox1.Text);
            if (unameMatch.Success)
            {
                user.Name = textBox1.Text;
            }
            else
            {
                MessageBox.Show("adinizi duzgun daxil edin");
            }

            //validation surname
            Regex usurname = new Regex(onlyLetters);
            Match usurnameMatch = usurname.Match(textBox2.Text);
            if (usurnameMatch.Success)
            {
                user.Surname = textBox2.Text;
            }
            else
            {
                MessageBox.Show("soy adinizi duzgun daxil edin");
            }

            //username validation
            Regex username = new Regex(onlyLetters);
            Match usernameMatch = username.Match(textBox3.Text);
            if (usernameMatch.Success)
            {
                user.UserName = textBox3.Text;
            }
            else
            {
                MessageBox.Show("istifadeci adinizi duzgun daxil edin");
            }
            string emailPattern = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
            //email validation

            Regex mailpattern = new Regex(emailPattern);
            Match mailMatch = mailpattern.Match(textBox4.Text);
            if (mailMatch.Success)
            {
                user.Email = textBox4.Text;
            }
            else
            {
                MessageBox.Show("emaili duzgun daxil edin");
            }
            if ( kod.Text != "" || unameMatch.Success)
            {
                Ulist.Add(user);
                this.Close();
                th = new Thread(opennewform);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();
            }
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            kod.Text = "";

        }
        private void opennewform(object obj)
        {
            Application.Run(new Product());
        }

    }
}
