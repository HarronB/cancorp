# frozen_string_literal: true

class CategoriesController < ApplicationController
  add_breadcrumb I18n.t('breadcrumbs.first'), :categories_path

  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb I18n.t('breadcrumbs.second'), @category, only: %w[second]
  end
end
