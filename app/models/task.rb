class Task < ActiveRecord::Base
  belongs_to :user
  validates :description, length: {minimum: 2}, presence: true
end
