class Subscriber < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_many :groups, through: :subscriptions

  validates :phone, presence: true

  phony_normalize :phone, default_country_code: 'FR'
end
