class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :media_type
      t.datetime :start_date
      t.string :union
      t.text :notes
      t.integer :casting_office_id

      t.timestamps
    end
  end
end
