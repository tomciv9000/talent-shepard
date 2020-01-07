class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :media_type
      t.datetime :start_date
      t.integer :union
      t.text :notes
      t.integer :casting_office_id

      t.timestamps
    end
  end
end
