class RenameAccountIdToOrganizationId < ActiveRecord::Migration[6.0]
  def change
    rename_column :actors, :account_id, :organization_id
  end
end
