class Message < ActiveRecord::Base
  belongs_to :group

  validates :body, presence: true

  def self.ordered
    order(created_at: :desc)
  end
end
