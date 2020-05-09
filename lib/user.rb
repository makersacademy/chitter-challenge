class User

  def self.log_out
    session[:user_name] = nil
  end

end