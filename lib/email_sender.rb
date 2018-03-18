require 'pony'

class Emailsender

  def self.send(email)
    Pony.options = {
      :subject => "Someone mentioned you on Chitter!",
      :body => "",
      :via => :smtp,
      :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => 'donotreplychitter@gmail.com',
      :password             => 'chitter123',
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain"
  }
}
    Pony.mail(:to => email)
  end
end

