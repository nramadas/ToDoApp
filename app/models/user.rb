class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  validates_presence_of   :name, message: "cannot be blank"
  validates_length_of     :name, in: 1..30,
                          message: "must be between 1 and 30 characters"

  validates_presence_of   :email, message: "cannot be blank"
  validates_uniqueness_of :email, case_sensitive: false,
                          message: "is already registered"
  validates_format_of     :email,
                          with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          message: "is invalid"

  validates_length_of     :password, minimum: 8,
                          message: "must be atleast 8 characters long"

  validates_presence_of   :password_confirmation, message: "cannot be blank"

  has_many :tasks

end
