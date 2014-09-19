require 'spec_helper'

describe SendTextMessageJob do
  describe '.perform' do
    it 'sends a text message' do
      twilio = stub_twilio_api

      SendTextMessageJob.new('phone', 'body').perform

      expect(twilio).to have_received(:send_sms).with('phone', 'body')
    end
  end

  def stub_twilio_api
    api = double(:twilio_api, send_sms: true)
    TwilioApi.stub(new: api)
    api
  end
end
