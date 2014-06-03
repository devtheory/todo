class AddExpirationToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :expires_at, :datetime
    add_column :tasks, :completed, :boolean
  end
end
