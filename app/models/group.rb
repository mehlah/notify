class Group < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions
  has_many :messages

  validates :class_name, presence: true
end
