class Task < ActiveRecord::Base
  belongs_to :user
  validates :description, length: {minimum: 2}, presence: true
  default_scope {order("expires_at ASC")}

  def completed?
    status = "Expired"
    if self.completed == true
      status = "Completed"
    end
    status
  end

  def self.remove_inactive
    Task.where("expires_at <= ?", Time.now).destroy_all
    Task.where(completed: true).destroy_all
  end

end
