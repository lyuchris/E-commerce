class AddQuantityToCartItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :cart_items, :quantity
  end
end
