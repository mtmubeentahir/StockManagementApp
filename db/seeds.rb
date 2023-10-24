# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Subcategory.destroy_all
Category.destroy_all

# Sample Categories for a Gold Jewelry Shop
Category::GOLD_CATEGORIES.each do |c|
  Category.create(name: c, slug: Category::SLUG_TYPE[:gold])
end
# Sample Categories for a Silver Jewelry Shop
Category::SILVER_CATEGORIES.each do |c|
  Category.create(name: c, slug: Category::SLUG_TYPE[:silver])
end

puts "Sample categories created successfully."

# Sample Categories for a Female Jewelry
Category.gold.each do |category|
  Subcategory::GOLD_SUBCATEGORIES.each do |sc|
    category.subcategories.create(name: sc, audience_type: Subcategory::AUDIENCE_TYPE[:male])
    category.subcategories.create(name: sc, audience_type: Subcategory::AUDIENCE_TYPE[:female])
  end
end
# Sample Categories for a Male Jewelry
Category.silver.each do |category|
  Subcategory::SILVER_SUBCATEGORIES.each do |sc|
    category.subcategories.create(name: sc, audience_type: Subcategory::AUDIENCE_TYPE[:male])
    category.subcategories.create(name: sc, audience_type: Subcategory::AUDIENCE_TYPE[:female])
  end
end
puts "Sample subcategories created successfully."