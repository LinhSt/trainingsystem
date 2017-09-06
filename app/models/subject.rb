class Subject < ApplicationRecord
  has_many :courses_subjects
  has_many :tasks
  has_many :user_subjects
  has_many :users, through: :user_subjects
  has_many :courses, through: :courses_subjects
  validates :name, presence: true
  validates :description, presence: true, length: {in: 5..1000}
  validates :content, presence: true, length: {minimum: 5}
end
