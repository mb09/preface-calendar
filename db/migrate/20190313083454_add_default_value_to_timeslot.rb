class AddDefaultValueToTimeslot < ActiveRecord::Migration[5.2]
  def change
    change_column :timeslots, :state, :string, null: false, default: "Available"
  end
end
