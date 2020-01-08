class RenameOrganizationIdToAgencyIdInActorsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :actors, :organization_id, :agency_id
  end
end
