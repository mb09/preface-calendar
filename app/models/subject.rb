class Subject < ApplicationRecord
  has_many :teacher_subject, dependent: :destroy
end
