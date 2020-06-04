class SimplifyBookingTableToJustHours < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :end_date
    remove_column :bookings, :end_time
    remove_column :bookings, :start_time
    add_column :bookings, :hours, :integer
  end
end
