class RecreateUserTableAttempt < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :admin, :default => false
      t.boolean :confirmed, :default => false
      t.integer :agency_id

      t.timestamps
    end
  end
end
