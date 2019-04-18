# frozen_string_literal: true

class ProductsController < ApplicationController
  add_breadcrumb I18n.t('breadcrumbs.first'), :root_path
  add_breadcrumb I18n.t('breadcrumbs.second'), :categories_path, only: %w[second]
  def index
    @products = Product.includes(:category).paginate(page: params[:page], per_page: 10).order(:name)
    @order_product = current_order.order_products.new
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb I18n.t('breadcrumbs.second'), :categories_path, only: %w[second]
    add_breadcrumb I18n.t('breadcrumbs.third'), :product_path, only: %w[third]
  end
end

# includes(:category, :order)
