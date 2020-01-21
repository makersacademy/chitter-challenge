# email server settings

class EmailSettings

  SETTINGS = {:address => 'smtp.gmail.com',   # add smtp server address
  :port => '587',                             # add smtp server port
  :domain => 'gmail.com',                     # add email domain
  :user_name => 'testuser',                   # add email username
  :password => 'securepassword123',           # add email password
  :authentication => 'plain',
  :enable_starttls_auto => true
  }

end
