class Course < ActiveRecord::Base
  validates :course_name, presence: true

  has_and_belongs_to_many :students
end
