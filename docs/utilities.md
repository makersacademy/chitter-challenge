# Utilities Class Design and Interface

The `Utilities` class provides access to some methods to validate strings, send emails alerts

## The Class Interface

```ruby
# Repository class
# (in lib/utilities.rb)

class Utilities
  
  # Sanitize input, escape html
  # One argument: the content (string)
  def peep_from_record(record)
    # Returns a string where HTML has been escaped
  end
  
  # Check for tags
  # One argument: the content (string)
  def check_for_tag(content)
    # Scan the content for tags like `@username`
    
    # Returns an array of strings
  end
  
  # Finds email address from usernames
  # One argument: usernames (array)
  def find_email_addresses(usernames)
    # Returns an array of email addresses
  end
  
  # Validates username
  # One argument: username
  def validate_username(username)
    # It uses regex to validate username string
    # Returns boolean
  end
  
  # Validates name
  # One argument: name
  def validate_name(name)
    # It uses regex to validate name string
    # Returns boolean
  end
  
  # Validates email address
  # One argument: email address
  def validate_email(email address)
    # It uses regex to validate email address string
    # Returns boolean
  end
  
  # Sends email if user has been tagged
  # Email address
  def send_email(email_address)
    # This method is just a stub
    # Can be used to send alert email when the user is tagged in a peep
    # There are multiple ways to achieve this:
    # - It can be implemented via `Net::SMTP`
    # - It can be implement via a third-party service that offers API
  end
end 
 
```