# frozen_string_literal: true

class AddTotalSubtotalTaxStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :total, :decimal
    add_column :orders, :tax, :decimal
    add_column :orders, :shipping, :decimal
  end
end
