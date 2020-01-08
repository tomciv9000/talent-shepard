class RemovePasswordDigestFromOrganizations < ActiveRecord::Migration[6.0]
  def change
    remove_column :organizations, :password_digest, :string
  end
end
