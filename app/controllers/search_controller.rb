# frozen_string_literal: true

class SearchController < ApplicationController
  def results
    @query = params[:query]
    @queryc = params[:queryc]
    @products = Product.where('name LIKE ?', "%#{@query}%")
                       .where('category_id LIKE ?', "%#{@queryc}%")
  end
end
