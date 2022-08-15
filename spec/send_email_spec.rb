require 'send_email'

describe SendEmail do
  it 'sends an email and returns a 202 status code' do
    response = double :response, status_code: 202
    send_email = SendEmail.new(response)
    message = "You've been mentioned in a Peep by Username! They wrote 'content @User' on 08:15 PM Friday 12 August 2022."
    expect(send_email.send_email(message)).to eq 202
  end

  it 'is unable to send an email and returns a 403 status code' do
    response = double :response, status_code: 403
    send_email = SendEmail.new(response)
    message = "You've been mentioned in a Peep by Username! They wrote 'content @User' on 08:15 PM Friday 12 August 2022."
    expect(send_email.send_email(message)).to eq 403
  end
end
