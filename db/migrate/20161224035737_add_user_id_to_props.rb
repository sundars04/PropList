class AddUserIdToProps < ActiveRecord::Migration[5.0]
  def change
    add_column :props, :user_id, :integer
  end
end
