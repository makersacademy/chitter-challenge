

class SendMail

  def self.set_options(subject:, body:)

    Pony.options = {
        :subject => subject,
        :body => body,
        :via => :smtp,
        :via_options => {
            :address              => ENV['ADDRESS'],
            :port                 => '587',
            :enable_starttls_auto => true,
            :user_name            => ENV['GMAIL_USER'],
            :password             => ENV['GMAIL_PASS'],
            :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
            :domain               => "localhost.localdomain"
        }
    }
  end

  def self.send(subject:, body:, email:)
    set_options(subject: subject, body: body)
    Pony.mail(:to => email)
  end

  def self.compose_subject
    "You have been tagged!"
  end

  def self.compose_body(tagger:)
    "You have been tagged by #{tagger}"
  end



end