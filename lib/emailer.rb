require 'pony'

class Emailer
  def self.send_email(to:, peeper:, content:)
    Pony.mail(:to => to,
      :from => 'cj_monty10@hotmail.com',
      :subject => 'You were tagged in a peep',
      :body => "hey you were tagged in a peep\n #{content} - sent by #{peeper}")
  end
end
