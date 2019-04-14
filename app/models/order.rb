# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer

  #added for shopping cart
  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal

  has_many :order_products
  has_many :products, through: :order_products

  validates :date, :confirmation, presence: true



#added for shopping cart
  def subtotal
    order_products.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
