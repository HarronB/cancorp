# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_products
  has_many :products, through: :order_products

  validates :date, :confirmation, presence: true
end
