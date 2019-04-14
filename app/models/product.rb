# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :price, :description, presence: true
  validates :price, numericality: true

  mount_uploader :image, ImageUploader
end
