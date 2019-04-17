# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).paginate(page: params[:page], per_page: 10).order(:name)
    @order_product = current_order.order_products.new
  end

  def show
    @product = Product.find(params[:id])
  end
end

# includes(:category, :order)
