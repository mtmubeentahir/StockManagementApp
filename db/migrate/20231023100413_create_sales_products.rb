class CreateSalesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_products do |t|
      t.references :sale, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :weight
      t.decimal :price
      t.string :price_type
      t.integer :quantity
      t.decimal :discount
      t.string :discount_type
      t.decimal :additional_charges
      t.string :additional_charges_type

      t.timestamps
    end
  end
end
