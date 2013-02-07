class Task < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  validates_presence_of :user_id, message: "cannot be blank"
  validates_presence_of :title, message: "cannot be blank"
  validates_length_of   :body, maximum: 1000, message: "is too long"

  belongs_to :user, dependent: :destroy

  has_many :tag_tasks
  has_many :tags, through: :tag_tasks
end
