class AddContactToApartments < ActiveRecord::Migration[8.0]
  def change
    add_column :apartments, :contact_name, :string
    add_column :apartments, :contact_phone, :string
    add_column :apartments, :contact_email, :string
  end
end
