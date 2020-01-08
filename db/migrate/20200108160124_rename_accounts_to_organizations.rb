class RenameAccountsToOrganizations < ActiveRecord::Migration[6.0]
  def change
    rename_table :accounts, :organizations
  end 
end
