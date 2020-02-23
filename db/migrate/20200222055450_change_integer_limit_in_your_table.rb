class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :tel, :integer, limit: 8
  end 
end