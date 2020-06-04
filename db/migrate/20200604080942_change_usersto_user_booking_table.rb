class ChangeUserstoUserBookingTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :users_id, :user_id
    add_foreign_key :pets, :categories
    add_foreign_key :bookings, :users
  end
end
