class AddUnitPriceToOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :unit_price, :decimal
  end
end
