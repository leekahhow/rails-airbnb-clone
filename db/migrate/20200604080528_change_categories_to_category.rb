class ChangeCategoriesToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :categories_id, :category_id
  end
end
