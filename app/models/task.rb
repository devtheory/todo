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
    Task.where("expires_at <= ? OR completed == ?", Time.now, true).destroy_all
  end

end
