class RenameOrganizationIdToAgencyIdInUsersTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :organization_id, :agency_id
  end
end
