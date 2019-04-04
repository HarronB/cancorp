class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product  #creates correspding FK in the product table
end
