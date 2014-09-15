class Group < ActiveRecord::Base
  belongs_to :user

  validates :class_name, presence: true
end
