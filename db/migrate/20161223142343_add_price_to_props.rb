class AddPriceToProps < ActiveRecord::Migration[5.0]
  def change
    add_column :props, :price, :decimal, precision: 12, scale: 3
  end
end
