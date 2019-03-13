class AddSubjectStringToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :subject_string, :string
  end
end
