# data processing class
class DataProcessor

  @current_user = nil

  def self.create(verification_class, db_proc_class)
    @verification_class = verification_class
    @db_proc_class = db_proc_class
    # @db_proc_class.environment
  end

  def self.current_user
    @current_user
  end

  def self.login(username, password)
    return 'credentials invalid' unless @verification_class.password_match?(username, password)
    @current_user = username
    "Welcome #{username}"
  end

  def self.logout
    return 'Not Logged in' if @current_user.nil?
    @current_user = nil
  end

  def self.create_account(data)
    return 'invalid email' unless @verification_class.valid_email?(data[:email])
    return 'invalid password' unless @verification_class.valid_password?(data[:password])
    return 'username taken' if @verification_class.username_exists?(data[:username])
    @db_proc_class.write(data, 'users')
    'account created'
  end

  def self.update_account
    # todo add update code
  end

  def self.delete_account
    # todo add delete code
    'account deleted'
  end

  def self.post_message(data)
    return 'above character limit' unless @verification_class.valid_message?(data[:msg])
    @db_proc_class.write(data, 'twats')
    'You just twatted!'
  end

end
