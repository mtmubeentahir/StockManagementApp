class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  # Define the types and subcategories
  AUDIENCE_TYPE = {
    male: 'Male',
    female: 'Female'
  }
  SILVER_SUBCATEGORIES = ['Italian', 'Rodium', 'Local']
  GOLD_SUBCATEGORIES = ['Masrasi', 'Singapuri']

  validates :name, presence: true
  validates :audience_type, inclusion: {in: AUDIENCE_TYPE.values}

  scope :male, -> { where(audience_type: AUDIENCE_TYPE[:male])}
  scope :female, -> { where(audience_type: AUDIENCE_TYPE[:female])}
end
