require 'pony'

class EmailClient

  Pony.options = {
    # :subject => "",
    # :body => "This is the body.",
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => 'chitterappshaun@gmail.com',
      :password             => ENV['CHITTERAPPPASSWORD'],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain"
    }
  }

  def self.mail(email,subject,body)
    Pony.mail(:to => email, :subject => subject, :body => body)

  end 
end 