class CreateRepresentations < ActiveRecord::Migration[6.0]
  def change
    create_table :representations do |t|
      t.boolean :under_contract
      t.text :notes
      t.integer :agency_id
      t.integer :actor_id
      t.timestamps
    end
  end
end
