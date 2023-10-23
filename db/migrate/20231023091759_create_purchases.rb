class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.date :date
      t.decimal :total_amount
      t.decimal :discount
      t.decimal :additional_charges

      t.timestamps
    end
  end
end
