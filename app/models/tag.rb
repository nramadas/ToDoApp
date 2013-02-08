class Tag < ActiveRecord::Base
  attr_accessible :tag_name, :task_id

  validates_presence_of   :tag_name, message: "must be provided"
  validates_uniqueness_of :tag_name, case_sensitive: false,
                           message: "already exists"

  has_many :tag_tasks
  has_many :tasks, through: :tag_tasks, dependent: :destroy

  has_many :users, through: :tasks

  def self.make_tag(value)
    Tag.where(tag_name: value).first || Tag.create(tag_name: value)
  end
end