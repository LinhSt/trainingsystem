class Subject < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {in: 10..1000}
  validates :content, presence: true, length: {minimum: 10}
end
