class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :date
      t.decimal :total_amount
      t.decimal :discount

      t.timestamps
    end
  end
end
