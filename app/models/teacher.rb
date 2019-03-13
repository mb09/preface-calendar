class Teacher < ApplicationRecord

  has_many :teacher_subject, dependent: :destroy
  has_many :timeslot, dependent: :destroy
end
