class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  before_save :default_status

  def default_status
    self.status ||= "0"
  end
end
