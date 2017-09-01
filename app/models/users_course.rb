class UsersCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user
  # scope :user_course,->{where role: "trainee"}
end
