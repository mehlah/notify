class Group < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions
  has_many :messages

  validates :name, presence: true
end
