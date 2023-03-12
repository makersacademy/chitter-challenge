class Peep 
  def initialize(username, message) # username and message are both strings 
    @username = username
    @message = message
  end

  def username
    return @username 
    # Returns a string of the username
  end

  def message
    return @message 
    # Returns a string of the message
  end

  def format
    # Returns a string in the format MESSAGE peeped by USERNAME
  end 

end 