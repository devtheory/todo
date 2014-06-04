task clear_tasks: :environment do
  Task.where("expires_at <= ?", Time.now).destroy_all
  Task.where(completed: true).destroy_all
end