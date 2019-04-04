# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @order = Order.order(:date)
  end

  def show
    @order = Order.find(params[:id])
  end
end
