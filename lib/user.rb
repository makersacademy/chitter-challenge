require './lib/db/connect.rb'
require './lib/string.rb'
require 'uri'

class User

  def self.query(query, db_connection = Connect.initiate(:chitter))
    db_connection.exec(query)
  end

  def self.keys_and_values
    @query_keys, @query_values = [], []
  end

  def nth(n)
    return self[[n.to_i, 0].max] unless self.count <= [n.to_i, 0].max
    nil
  end

  def self.not_an_email_address(key, value)
    unless (key.to_s.clean_key.downcase == "email") && (value.to_s =~ URI::MailTo::EMAIL_REGEXP) != 0
      true
    else
      false
    end
  end

  def self.check_key_value_return(value = :NULL, key = :NULL)
    return if key.to_s.clean_key.downcase == "submit"
    value = value.to_s.hash_1 if key == :password || key == :user_name
    @query_values << value.to_s.clean_value if not_an_email_address(key, value)
    @query_keys << key.to_s.clean_key
  end

  def self.add(table_column_values_hash = {})
    return nil if table_column_values_hash.empty?
    keys_and_values
    table_column_values_hash.each { |key, value| check_key_value_return(value, key) }
    return nil if @query_keys.count != @query_values.count
    query("INSERT INTO users (#{@query_keys.join(",")}) VALUES (#{@query_values.join(",")}) RETURNING id").to_a
  end

  def self.find(user_name)
    [keys_and_values, check_key_value_return(user_name)]
    users_return = query("SELECT * FROM users WHERE username = #{@query_values.first}").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

  def self.get(user_name, password)
    [keys_and_values, check_key_value_return(user_name)]
    password = password.to_s.hash_1.clean_value
    users_return = query("SELECT * FROM users WHERE username = #{@query_values.last} AND password = #{password}").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

  def self.delete(user_name)
    [keys_and_values, check_key_value_return(user_name)]
    query("DELETE FROM users WHERE username = #{@query_values.last}")
  end

  def self.all(user_name)
    users_return = query("SELECT * FROM users").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

end
