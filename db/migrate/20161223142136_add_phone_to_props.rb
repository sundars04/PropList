class AddPhoneToProps < ActiveRecord::Migration[5.0]
  def change
    add_column :props, :phone, :integer, :limit => 8    
  end
end
