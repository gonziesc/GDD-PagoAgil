﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PagoAgilFrba.AbmRol
{
    public partial class ModificacionRol : Form
    {
        int role_code;
        AbmRol parent;
        List<Functionality> added_functionalities = new List<Functionality>();
        List<Functionality> deleted_functionalities = new List<Functionality>();

        public ModificacionRol(DataGridViewRow row, AbmRol parent)
        {
            this.role_code = Int32.Parse(row.Cells["rol_id"].Value.ToString());
            this.parent = parent;
            InitializeComponent();
            this.textBox1.Text = row.Cells["rol_nombre"].Value.ToString();
            this.checkBox1.Checked = (bool)row.Cells["rol_habilitado"].Value;
            this.button1.Click += this.update;
            this.fill_functionalities_list();
        }

        public ModificacionRol(AbmRol parent)
        {
            this.parent = parent;
            InitializeComponent();
            this.label1.Text = "Cree un nuevo rol";
            this.button1.Text = "Crear";
            this.button1.Click += this.insert;
            this.fill_functionalities_list();
        }

        private void update(object sender, EventArgs e)
        {
            var connection = DBConnection.getInstance().getConnection();
            SqlCommand update_command = new SqlCommand("POSTRESQL.modificar_rol", connection);
            update_command.CommandType = CommandType.StoredProcedure;
            update_command.Parameters.Add(new SqlParameter("@rol_id", this.role_code));
            update_command.Parameters.Add(new SqlParameter("@rol_nombre", this.textBox1.Text));
            update_command.Parameters.Add(new SqlParameter("@rol_habilitado", this.checkBox1.Checked));

            connection.Open();
            if (update_command.ExecuteNonQuery() >= 1)
            {
                this.apply_sp_to_list_of_functionalities(this.added_functionalities, "POSTRESQL.agregar_funcionalidad");
                this.apply_sp_to_list_of_functionalities(this.deleted_functionalities, "POSTRESQL.quitar_funcionalidad");
                this.Close();
                MessageBox.Show("Se modificaron los campos correctamente");
                this.parent.fill_data_set();  // Para que refresque el data set
            }
            else
                MessageBox.Show("Hubo un error al modificar los datos. Intente nuevamente");
            connection.Close();
        }

        private void insert(object sender, EventArgs e)
        {
            if (this.textBox1.Text == "")
            {
                MessageBox.Show("El rol debe tener un nombre", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            var connection = DBConnection.getInstance().getConnection();
            SqlCommand insert_command = new SqlCommand("POSTRESQL.crear_rol", connection);
            insert_command.CommandType = CommandType.StoredProcedure;
            insert_command.Parameters.Add(new SqlParameter("@rol_nombre", this.textBox1.Text));
            insert_command.Parameters.Add(new SqlParameter("@rol_habilitado", this.checkBox1.Checked));

            connection.Open();
            string message;
            try
            {
                int inserted_pk = Int32.Parse(insert_command.ExecuteScalar().ToString());
                this.role_code = inserted_pk;
                this.apply_sp_to_list_of_functionalities(this.added_functionalities, "POSTRESQL.agregar_funcionalidad");
                this.Close();
                message = "Se agregó correctamente el rol " + this.textBox1.Text;
                this.parent.fill_data_set();  // Para que refresque el data set
            }
            catch
            {
                message = "Hubo un error al agregar el nuevo rol. Intente nuevamente";
            }
            finally
            {
                connection.Close();
            }
            MessageBox.Show(message);
        }

        private void fill_functionalities_list()
        {
            var connection = DBConnection.getInstance().getConnection();
            List<Functionality> current_functionalities = new List<Functionality>();
            List<Functionality> all_functionalities = new List<Functionality>();

            // Pido todas las funcionalidades
            SqlCommand all_functionalities_command = new SqlCommand("SELECT * FROM POSTRESQL.Funcionalidad", connection);
            connection.Open();
            SqlDataReader reader = all_functionalities_command.ExecuteReader();
            while (reader.Read())
                all_functionalities.Add(new Functionality(Int32.Parse(reader["func_id"].ToString()), reader["func_descripcion"].ToString()));
            connection.Close();

            // Si es un update, pido las funcionalidades asignadas al rol
            if (this.role_code > 0)
            {
                SqlCommand current_functionalities_command = new SqlCommand("POSTRESQL.funcionalidades_del_rol", connection);
                current_functionalities_command.CommandType = CommandType.StoredProcedure;
                current_functionalities_command.Parameters.Add(new SqlParameter("@rol_id", role_code));
                connection.Open();
                SqlDataReader second_reader = current_functionalities_command.ExecuteReader();
                while (second_reader.Read())
                    current_functionalities.Add(new Functionality(Int32.Parse(second_reader["func_id"].ToString()), second_reader["func_descripcion"].ToString()));
                connection.Close();
            }

            foreach (Functionality functionality in all_functionalities)
                this.checkedListBox1.Items.Add(functionality, current_functionalities.Exists(f => functionality.Equals(f)));
        }

        private void apply_sp_to_list_of_functionalities(List<Functionality> list, string sp)
        {
            var connection = DBConnection.getInstance().getConnection();
            SqlCommand command;
            foreach (Functionality functionality in list)
            {
                command = new SqlCommand(sp, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@func_rol_rol", this.role_code));
                command.Parameters.Add(new SqlParameter("@func_rol_funcionalidad", functionality.code));

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        private void CheckedListBox1_ItemCheck(Object sender, ItemCheckEventArgs e)
        {
            Functionality changed_functionality = (Functionality)this.checkedListBox1.Items[e.Index];

            if (e.NewValue == CheckState.Checked)
            {
                // Si antes la había marcado para quitarla, la seteo para agregar
                if (this.deleted_functionalities.Contains(changed_functionality))
                    this.deleted_functionalities.Remove(changed_functionality);
                // Para no agregarla varias veces, checkeando el botón más de una vez
                if (!this.added_functionalities.Contains(changed_functionality))
                    this.added_functionalities.Add(changed_functionality);
            }
            else
            {
                // Idem anterior, pero para quitar la funcionalidad
                if (this.added_functionalities.Contains(changed_functionality))
                    this.added_functionalities.Remove(changed_functionality);
                if (!this.deleted_functionalities.Contains(changed_functionality))
                    this.deleted_functionalities.Add(changed_functionality);
            }

        }

        private void ModificacionRol_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}