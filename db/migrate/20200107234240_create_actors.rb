class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender_portrayal
      t.boolean :sag_aftra
      t.boolean :aea
      t.datetime :dob
      t.string :location
      t.text :notes
      t.integer :account_id

      t.timestamps
    end
  end
end
