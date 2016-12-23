class AddCategoryIdToProps < ActiveRecord::Migration[5.0]
  def change
    add_column :props, :category_id, :integer
  end
end
