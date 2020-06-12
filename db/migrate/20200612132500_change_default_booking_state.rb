class ChangeDefaultBookingState < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :status, :string, :default => "NA"
  end
end
