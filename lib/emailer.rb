require 'pony'

class Emailer
  def self.send_email(to:, peeper:, content: )
    Pony.mail(:to => 'tomdamant@hotmail.com',
      :from => 'tomdamant@hotmail.com',
      :subject => 'You were tagged in a peep',
      :body => "Hello there, you were tagged in a peep\n #{content} - sent by #{peeper}")
    end
end
