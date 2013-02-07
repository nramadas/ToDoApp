class AddTagTaskJoinTable < ActiveRecord::Migration
  def change
    create_table :tag_tasks do |t|
      t.integer :tag_id
      t.integer :task_id
    end
  end
end
