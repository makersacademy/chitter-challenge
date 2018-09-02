require_relative './database_connect'
require 'pg'

class InputCheckers

  extend DatabaseConnect

  def self.unique_input_checker(option, checking_key)
    result = database_connect.exec("SELECT #{checking_key} FROM users;")
    result.map do |items|
      return true if items.values[0] == option
    end
    false
  end

  def self.log_in_checker(user_name, password)
    result = database_connect.exec("SELECT user_name, password FROM users;")
    result.map do |items|
      return true if items.values[0] == user_name && items.values[1] == password
    end
    false
  end

end
