# frozen_string_literal: true

class ChangePriceToDecimalFromFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :decimal
  end
end
