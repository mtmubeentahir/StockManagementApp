class Product < ApplicationRecord
  belongs_to :subcategory

  has_many :sales_products
  has_many :sales, through: :sales_products


  has_many :purchase_products
  has_many :purchases, through: :purchase_products
end
