require 'spec_helper'

describe Message do
  it { should belong_to(:group) }

  it { should validate_presence_of(:body) }

  describe '.ordered' do
    it 'returns newer messages first' do
      create(:message, body: 'first', created_at: 1.days.ago)
      create(:message, body: 'third', created_at: 3.day.ago)
      create(:message, body: 'second', created_at: 2.days.ago)

      expect(Message.ordered.pluck(:body)).to eq(%w(first second third))
    end
  end

  describe '#broadcast' do
    it 'enqueues a job to send the message for each subscriber of the group' do
      SendTextMessageJob.stub(:enqueue)
      group = create(:group, :with_subscriptions, subscriptions_count: 2)
      message = create(:message, group: group)

      message.broadcast

      expect(SendTextMessageJob).to have_received(:enqueue).twice
    end
  end
end
