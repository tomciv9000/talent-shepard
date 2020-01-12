class ChangeStartDateToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :start_date, :date
  end
end
