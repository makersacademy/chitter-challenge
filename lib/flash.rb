class Flash

  def self.welcome(name)
    "#{name}, thank you for signing up! Enjoy chitter!"
  end

  def self.long_peep
    "Your peep is too long. The max limit is 240 characters."
  end

  def self.no_name
    "Please enter your name."
  end

  def self.email_in_use
    "This email has been already registered."
  end

  def self.username_in_use
    "This username has been already registered."
  end

  def self.too_short
    "Please enter at least 4 characters in each field."
  end

  def self.after_log_in(name)
    "#{name}, you're logged in, happy chittering!"
  end

  def self.no_match
    "Username and password don't match. Try again."
  end

  def self.after_log_out
    "Thank you for visiting us, see you later!"
  end

  def self.thanks_for_comment
    "Thank you for your comment"
  end

  def self.no_id
    "There is no peep with this ID in our database. Check again the list of peeps."
  end

end
