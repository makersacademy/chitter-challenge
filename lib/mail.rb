require 'mail'

class Email


  def send(send_to, body)
    Mail.deliver do
      from     'me@test.lindsaar.net'
      to       send_to
      subject  'Here is the image you wanted'
      body     body
    end
  end
end
