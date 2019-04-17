# frozen_string_literal: true

class OrderProductsController < ApplicationController
  def create
    @order = current_order
    @order_product = @order.order_products.new(order_product_params)
    existing_order = @order.order_products.where(product_id: params[:order_product][:product_id])
    if existing_order.count >= 1
      existing_order.last.update_column(:quantity, existing_order.last.quantity + params[:order_product][:quantity].to_i)
      redirect_back(fallback_location: '#')
    else
      @order.save
      redirect_back(fallback_location: '#')
    end
    session[:order_id] = @order.id
    end

  def update
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.update_attributes(order_product_params)
    @order_products = @order.order_products
  end

  def destroy
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.destroy
    @order_products = @order.order_products
    redirect_back(fallback_location: '#')
  end

  private

  def order_product_params
    params.require(:order_product).permit(:quantity, :product_id)
  end
end
