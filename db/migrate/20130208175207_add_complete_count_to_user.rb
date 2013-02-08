class AddCompleteCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :completed_task_count, :integer
  end
end
