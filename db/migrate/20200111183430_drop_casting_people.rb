class DropCastingPeople < ActiveRecord::Migration[6.0]
  def change
    drop_table :casting_people
  end
end
