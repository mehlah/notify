class TwilioApi
  def client
    @client ||= Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def send_sms(to, body)
    client.account.sms.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to,
      body: body
    )
  end
end
