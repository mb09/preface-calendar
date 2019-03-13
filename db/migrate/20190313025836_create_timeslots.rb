class CreateTimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.references :teacher, foreign_key: true
      t.integer :dow
      t.time :start_time
      t.string :state
      t.string :footnote

      t.timestamps
    end
  end
end
