class Tag < ActiveRecord::Base
  attr_accessible :tag_name, :task_id

  validates_presence_of   :tag_name, message: "must be provided"
  validates_uniqueness_of :tag_name, case_sensitive: false,
                           message: "already exists"
  validates_presence_of   :task_id, message: "must be provided"

  has_many :tag_tasks
  has_many :tasks, through: :tag_tasks
end