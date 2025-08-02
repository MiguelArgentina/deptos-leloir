class CreateApartments < ActiveRecord::Migration[8.0]
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
