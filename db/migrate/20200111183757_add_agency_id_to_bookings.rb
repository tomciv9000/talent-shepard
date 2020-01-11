class AddAgencyIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :agency_id, :integer
  end
end
