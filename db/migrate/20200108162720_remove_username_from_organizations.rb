class RemoveUsernameFromOrganizations < ActiveRecord::Migration[6.0]
  def change
    remove_column :organizations, :username, :string
  end
end
