class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :role
      t.datetime :time
      t.string :address
      t.boolean :callback
      t.boolean :status
      t.text :notes
      t.integer :actor_id
      t.integer :casting_office_id
      t.integer :project_id

      t.timestamps
    end
  end
end
