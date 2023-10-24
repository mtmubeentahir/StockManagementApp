class AddTypeToSubcategoryTable < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :audience_type, :string
  end
end
