class AddAgencyIdToCastingOffices < ActiveRecord::Migration[6.0]
  def change
    add_column :casting_offices, :agency_id, :integer
  end
end
