task clear_tasks: :environment do
  Task.where("expires_at <= ? OR completed == ?", Time.now, true).destroy_all
end