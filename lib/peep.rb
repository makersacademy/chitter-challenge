require './lib/db/connect.rb'
require './lib/string.rb'
require 'uri'
require 'digest/sha1'

class Peep

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
    @query_values << value.to_s.clean_value.to_i if key.to_s.clean_key.downcase == "id" && value.to_s.clean_value.to_i.is_a?(Integer)
    @query_values << value.to_s.clean_value if key.to_s.clean_key.downcase != "id"
    @query_keys << key.to_s.clean_key
  end

  def self.add(table_column_values_hash = {})
    [keys_and_values, table_column_values_hash.each { |key, value| check_key_value_return(value, key) }]
    return nil if @query_keys.count != @query_values.count || table_column_values_hash.empty?
    p @query_values
    p @query_keys
    users_return = query("INSERT INTO peeps (#{@query_keys.join(",")}) VALUES (#{@query_values.join(",")}) RETURNING id").to_a
    (users_return.nil? || (users_return.count != 1)) ? nil : users_return
  end

  def self.find(id)
    return nil unless id.to_s.to_i.is_a?(Integer)
    users_return = query("SELECT * FROM peeps WHERE id = #{id.to_s.to_i}").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

  def self.delete(id)
    [keys_and_values, check_key_value_return(id, :id)]
    query("DELETE FROM peeps WHERE id = #{@query_values.last}")
  end

  def self.all(order_by = 'DESC', limit = 100)
    users_return = query("SELECT * FROM peeps ORDER BY created_at #{order_by} LIMIT #{limit.to_s}").to_a
    users_return.map{ |pair| pair.transform_keys(&:to_sym) }
  end

end
