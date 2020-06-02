class ForPetsAddReferencetoCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :pets, :categories, foreign_key: true
  end
end
