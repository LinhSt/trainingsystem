class Task < ApplicationRecord
  has_many :users_tasks
  has_many :users, through: :users_tasks
  belongs_to :subject
  scope :select_tasks,-> (id){where "subject_id = ? ",id}
end
