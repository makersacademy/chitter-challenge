require "pony"

class EmailTag
  def send(send)
    Pony.options = { :from => "okhanbayov@gmail.com", :via => :smtp, :via_options => {
      :address => "smtp.gmail.com",
      :port => "587",
      :enable_starttls_auto => true,
      :user_name => "okhanbayov@gmail.com",
      :password => "zfmroongivirhusv",
      :authentication => :plain,
      :domain => "localhost.localdomain",
    } }

    Pony.mail(:to => send, :subject => "Chitter tag", :body => "Somebody has tagged you in a post on Chitter.")
  end
end
