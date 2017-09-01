class Course < ApplicationRecord
  has_many :courses_subjects, dependent: :destroy
  has_many :users_courses, dependent: :destroy
  has_many :users, through: :users_courses
  has_many :subjects, through: :courses_subjects
  accepts_nested_attributes_for :users_courses,
    :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :courses_subjects,
    :reject_if => lambda { |a| a[:subject_id].blank? }, :allow_destroy => true
end
