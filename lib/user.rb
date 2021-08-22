require './lib/db/connect.rb'
require './lib/string.rb'

class User

  def self.keys_and_values
    @query_keys, @query_values = [], []
  end

  def nth(n)
    return self[[n.to_i, 0].max] unless self.count <= [n.to_i, 0].max
    nil
  end

  def self.check_key_value_return(value = :NULL, key = :NULL)
    value = value.to_s.hash_1 if key == :password || key == :user_name
    @query_values << value.to_s.clean_value 
    @query_keys << key.to_s.clean_key
  end

  def self.new(table_column_values_hash = {}, db_connection = Connect.initiate(:chitter))
    return nil if table_column_values_hash.empty?
    keys_and_values
    table_column_values_hash.each { |key, value| check_key_value_return(value, key) }
    db_connection.exec("INSERT INTO users (#{@query_keys.join(",")}) VALUES (#{@query_values.join(",")})").to_a
  end

  def self.find(user_name, db_connection = Connect.initiate(:chitter))
    [keys_and_values, check_key_value_return(user_name)]
    users_return = db_connection.exec("SELECT * FROM users WHERE username = #{@query_values.first}").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

  def self.get(user_name, password, db_connection = Connect.initiate(:chitter))
    [keys_and_values, check_key_value_return(user_name)]
    password = password.to_s.hash_1.clean_value
    users_return = db_connection.exec("SELECT * FROM users WHERE username = #{@query_values.last} AND password = #{password}").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

  def self.delete(user_name, db_connection = Connect.initiate(:chitter))
    [keys_and_values, check_key_value_return(user_name)]
    db_connection.exec("DELETE FROM users WHERE username = #{@query_values.last}")
  end

  def self.all(user_name, db_connection = Connect.initiate(:chitter))
    users_return = db_connection.exec("SELECT * FROM users").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

end
