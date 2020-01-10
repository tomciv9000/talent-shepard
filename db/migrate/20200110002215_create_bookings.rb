class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :role
      t.string :rate
      t.boolean :contract_signed
      t.boolean :accepted
      t.integer :actor_id
      t.integer :project_id

      t.timestamps
    end
  end
end
