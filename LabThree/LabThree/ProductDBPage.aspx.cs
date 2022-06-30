using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LabThree
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ProductsDB.mdf;Integrated Security=True";
            SqlConnection conn = new SqlConnection(cs);

            this.conn = conn;
            this.conn.Open();
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            // Start of Load Product
            try
            {
                int id = Convert.ToInt32(txtId.Text);
                string query = "Select * from productTable Where id = " + id;
                SqlCommand command = new SqlCommand(query, this.conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    txtName.Text = (reader["Name"].ToString()).Replace(" ", string.Empty);
                    txtPrice.Text = reader["Price"].ToString();
                    txtQuantity.Text = reader["Quantity"].ToString();
                }
                else
                {
                    lblMessage.Text = "No Results for Product where id = " + id + ".";
                }
            } catch (Exception ex)
            {
                lblMessage.Text = "Error trying to load product from database";
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // Start of Insert Product
            try
            {
                string name = txtName.Text;
                double price = Convert.ToDouble(txtPrice.Text);
                int quantity = Convert.ToInt16(txtQuantity.Text);

                string query = "insert into productTable VALUES ('" + name + "','" + price + "','" + quantity + "')";
                SqlCommand command = new SqlCommand(query, this.conn);
                int rows = command.ExecuteNonQuery();
                lblMessage.Text = "Total rows inserted: " + rows;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Failed to insert product into Database.";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Start of Update Product
            try
            {
                string query = "update productTable set ";
                if (txtName.Text != "") { query += "name='" + txtName.Text + "' ,"; }
                if (txtPrice.Text != "") { query += "price='" + txtPrice.Text + "' ,"; }
                if (txtQuantity.Text != "") { query += "quantity='" + txtQuantity.Text + "'"; }
                if (query[query.Length - 1].Equals(",")) { query[query.Length - 1].Equals(" "); }

                query += "where id=" + txtId.Text;
                SqlCommand command = new SqlCommand(query, this.conn);
                int rows = command.ExecuteNonQuery();
                lblMessage.Text = "Total rows updated: " + rows;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Failed to update product into Database.";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Start of Delete Product
            try
            {
                string query = "delete from productTable where id=" + txtId.Text;
                SqlCommand command = new SqlCommand(query, this.conn);
                int rows = command.ExecuteNonQuery();
                lblMessage.Text = "Product has been delete from Database";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Failed to delete product into Database.";
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Start of Clear
                txtId.Text = "";
                txtName.Text = "";
                txtPrice.Text = "";
                txtQuantity.Text = "";
                lblMessage.Text = "";
        }
    }
}
