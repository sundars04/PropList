class CreateProps < ActiveRecord::Migration[5.0]
  def change
    create_table :props do |t|
      t.string :name
      t.text :address
      t.string :url
      t.string :bhk
      t.string :area
      t.integer :sqft

      t.timestamps
    end
  end
end
