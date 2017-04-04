class AddUserIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add column :products, :user_id, :integer
  end
end
