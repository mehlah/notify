class SendTextMessageJob < Struct.new(:subscriber_phone, :message_body)
  def self.enqueue(subscriber_phone, message_body)
    Delayed::Job.enqueue(new(subscriber_phone, message_body))
  end

  def perform
    twilio = TwilioApi.new
    twilio.send_sms(subscriber_phone, message_body)
  end
end
