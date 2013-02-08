class TagTask < ActiveRecord::Base
  attr_accessible :task_id, :tag_id

  belongs_to :task
  belongs_to :tag

  validates_uniqueness_of :tag_id, scope: :task_id
end