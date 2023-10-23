class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :weight
      t.string :price_type # Per garam / per product
      t.integer :stock_quantity
      t.references :subcategory, foreign_key: true
      t.decimal :discount
      t.string :discount_type # percentage / fixed
      t.decimal :additional_charges
      t.string :additional_charges_type # percentage / fixed

      t.timestamps
    end
  end
end
