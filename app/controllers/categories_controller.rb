# frozen_string_literal: true

class CategoriesController < ApplicationController
  add_breadcrumb 'home', :root_path
  add_breadcrumb 'Category Listing', :categories_path
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.name.to_s
  end
end
