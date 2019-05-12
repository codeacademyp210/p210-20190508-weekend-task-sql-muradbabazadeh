using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;

namespace user_login
{
    public partial class Product : Form
    {
        public Product()
        {
            InitializeComponent();
        }

        List<Products> product = new List<Products>();
        Products pr = new Products();
      
        private void Button2_Click(object sender, EventArgs e)
        {
            string onlyLetters = @"^[a-zA-Z]+$";
            bool isNameValid = Regex.IsMatch(pname.Text, onlyLetters);
            bool iBrandValid = Regex.IsMatch(brand.Text, onlyLetters);
            bool iscolorValid = Regex.IsMatch(color.Text, onlyLetters);
            double price ;
            int bcode;
            int stok;
            bool success = double.TryParse(pricee.Text, out price);
            bool success2 = Int32.TryParse(barcode.Text, out bcode);
            bool success3 = Int32.TryParse(stock.Text, out stok);
           
            if (success)
            {

                pr.Price = price;
               
            }
            else
            {
                MessageBox.Show("qiymeti duzgun daxil edin");
            }
            if (success2)
            {

                pr.Barcode = bcode;
            }
            else
            {
                MessageBox.Show("barkodu duzgun daxil edin");
            }
            if (success3)
            {

                pr.Stock = stok;
            }
            else
            {
                MessageBox.Show("stoku duzgun daxil edin");
            }
             
                pr.Color = color.Text;
               
                pr.Ad = ad.Text;
                pr.Category = comboBox1.Text;
                product.Add(pr);
                dataGridView1.Rows.Add(pr.Name, pr.Price, pr.Category, pr.Brand, pr.Color, pr.Barcode, pr.Stock);
              
            pname.Text = "";
            pricee.Text = "";
            brand.Text = "";
            color.Text = "";
            barcode.Text = "";
            stock.Text = "";
            ad.Text = "";
            comboBox1.Text = "";

        }

        private void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void Product_Load(object sender, EventArgs e)
        {

        }
    }
}
