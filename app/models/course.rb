class Course < ApplicationRecord
  validates :name, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses

  # Class Methods

  # Instance Methods
  def student_count
    students.count
  end
end
