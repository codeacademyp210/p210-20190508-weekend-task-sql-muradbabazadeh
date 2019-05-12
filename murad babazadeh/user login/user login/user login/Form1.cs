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


namespace user_login
{
    public partial class Form1 : Form
    {
        Thread th;
        public Form1()
        {
            InitializeComponent();
        }


        private void Button1_Click(object sender, EventArgs e)
        {



            if (username.Text == "Ekber" || usercode.Text.ToString() == "12345")
            {
                this.Close();
                th = new Thread(opennewform2);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();
            }
            else
            {
                MessageBox.Show("Adiniza uygun netice tapilmadi");

            }
            username.Text = "";
            usercode.Text = "";

        }

        private void opennewform2()
        {
            Application.Run(new Product());
        }

       
        private void Button2_Click(object sender, EventArgs e)
        {

            this.Close();
            th = new Thread(opennewform);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();

        }

            private void opennewform(object obj)
            {          
                Application.Run(new Register());
            } 
    }
}
