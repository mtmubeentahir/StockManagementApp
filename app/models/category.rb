class Category < ApplicationRecord
  GOLD_CATEGORIES = ['Rings', 'Bracelets', 'Chains', 'Earrings']
  SILVER_CATEGORIES = ['Rings', 'Bracelets', 'Chains', 'Earrings']

  SLUG_TYPE = {gold: 'Gold', silver: 'Silver'}

  validates :name, presence: true
  validates :slug, inclusion: {in: SLUG_TYPE.values}

  has_many :subcategories

  scope :gold, -> { where(slug: SLUG_TYPE[:gold])}
  scope :silver, -> { where(slug: SLUG_TYPE[:silver])}
  
  before_create :set_description

  def set_description
    self.description ||= "#{name} - #{slug}"
  end
end
