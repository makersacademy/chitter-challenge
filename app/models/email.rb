require 'mail'

class Email

  def self.send_email(options)
    Mail.deliver do
      from     options[:from] ||= "peeps@chitter.com"
      to       options[:to]
      subject  options[:subject] ||= "You have a new peep!"
      body     options[:body] ||= "Please connect to Chitter to see your new peep!"
    end
  end

end
