require 'pg'

class Input_checkers

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

  private

  def self.database_connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
