# data processing class
class DataProcessor

  @current_user = nil

  def self.set_up(verification_class)
    @verification_class = verification_class
  end

  def self.current_user
    @current_user
  end

  def self.login(username, password)

  end

end
