class AddUserIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :users, foreign_key: true
  end
end
