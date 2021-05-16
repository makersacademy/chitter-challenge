class LogInError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Incorrect username or password'
    super(msg)
  end
  
end

class AlreadyRegisteredError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'User already registered'
    super(msg)
  end
  
end
