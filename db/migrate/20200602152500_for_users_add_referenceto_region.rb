class ForUsersAddReferencetoRegion < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :regions, foreign_key: true
  end
end
