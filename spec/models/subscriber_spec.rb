require 'rails_helper'

describe Subscriber do
  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should have_many(:groups).through(:subscriptions) }

  it { should validate_presence_of(:phone) }

  describe 'phony_normalize' do
    it 'normalizes the phone number' do
      phones = [
        '06 42 75 55 92',
        '+336 42 75 55 92',
        '642755592',
        '06-42-75-55-92',
        'O6/42/75/55/92',
        '0033 6 42 75 55 92'
      ]

      phones.each do |phone|
        subscriber = build(:subscriber, phone: phone)

        subscriber.valid?

        expect(subscriber.phone).to eq('+33642755592')
      end
    end
  end
end
