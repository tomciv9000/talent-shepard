class AddAgencyIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :agency_id, :integer
  end
end
