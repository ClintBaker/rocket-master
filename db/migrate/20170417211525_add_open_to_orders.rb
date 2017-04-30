class AddOpenToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :open, :boolean, default: true
  end
end
