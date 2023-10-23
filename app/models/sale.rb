class Sale < ApplicationRecord
  has_many :additional_charge_types
  has_many :sales_products
  has_many :products, through: :sales_products
end
