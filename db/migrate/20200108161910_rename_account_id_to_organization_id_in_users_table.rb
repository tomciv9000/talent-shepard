class RenameAccountIdToOrganizationIdInUsersTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :account_id, :organization_id
  end
end
