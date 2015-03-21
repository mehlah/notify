class TwilioApi
  def client
    @client ||= Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def send_sms(to, body)
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: formatted_phone(to),
      body: body
    )
  end

  private

  def formatted_phone(number)
    number.phony_formatted(format: :international, spaces: '')
  end
end
