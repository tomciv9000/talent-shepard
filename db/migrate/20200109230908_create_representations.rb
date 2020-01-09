class CreateRepresentations < ActiveRecord::Migration[6.0]
  def change
    create_table :representations do |t|
      t.signed :boolean
      t.integer :agency_id
      t.integer :actor_id
      t.timestamps
    end
  end
end
