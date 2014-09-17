class Message < ActiveRecord::Base
  belongs_to :group

  validates :body, presence: true
end
