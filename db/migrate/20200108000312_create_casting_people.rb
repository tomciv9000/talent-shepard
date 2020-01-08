class CreateCastingPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :casting_people do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :direct_number
      t.integer :casting_office_id
      t.text :notes

      t.timestamps
    end
  end
end
