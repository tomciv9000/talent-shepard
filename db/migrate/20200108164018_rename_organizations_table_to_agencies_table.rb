class RenameOrganizationsTableToAgenciesTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :organizations, :agencies
  end 
end
