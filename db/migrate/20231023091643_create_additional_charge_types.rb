class CreateAdditionalChargeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_charge_types do |t|
      t.string :name
      t.text :description
      t.decimal :amount
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
