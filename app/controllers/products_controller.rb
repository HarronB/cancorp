# frozen_string_literal: true

class ProductsController < ApplicationController
  add_breadcrumb 'home', :root_path
  add_breadcrumb 'Category Listing', :categories_path
  add_breadcrumb 'Category', :categories_path
  def index
    @products = Product.includes(:category).paginate(page: params[:page], per_page: 10).order(:name)
    @order_product = current_order.order_products.new
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb @product.name.to_s
  end
end

# includes(:category, :order)
