class ChangeTypeToAnimalTypeCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :type, :animal_type
  end
end
