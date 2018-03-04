class AddCategoryIdToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :category_id, :string
  end
end
