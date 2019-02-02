require 'pg'

class ChitterDatabase

  @@database_connection

  def self.connect_to_database(database_name)
    if ENV['ENVIRONMENT'] == 'test'
      @@database_connection = PG.connect(dbname: "chitter_test")
    else
      @@database_connection = PG.connect(dbname: "#{database_name}")
    end
  end

  def self.check_user_details(database_name, database_table, user, user_password)
    self.connect_to_database(database_name)
    search_user_query = "SELECT (user_id) FROM #{database_table} " +
    "WHERE user_name = '#{user}' AND password = '#{user_password}';"
    user_exists = @@database_connection.exec(search_user_query)
    if user_exists.to_a.any?
      self.close_database_connection
      return true
    else
      self.close_database_connection
      return false
    end
  end

  def self.add_new_user(database_name, database_table, new_user, new_user_password)
    self.connect_to_database(database_name)
    @@database_connection.exec( "INSERT INTO #{database_table} (user_name, password) VALUES" +
    " ('#{new_user}', '#{new_user_password}');")
    self.close_database_connection
  end

  def self.all_chitters
    self.connect_to_database("chitter")
    record = @@database_connection.exec("SELECT user_name, chitter, posted_at " +
    "FROM users INNER JOIN chitter_messages ON users.user_id = chitter_messages.user_id " +
    "ORDER BY posted_at DESC;")
    record_content = record.map do |messages|
      [messages['user_name'], messages['chitter'], messages['posted_at']]
    end
  end

  def self.view_table(database_name, database_table, user, user_password)
    #database_table == "chitter_messages_test" if database_name == "chitter_test"
    user_id = self.get_user_id(database_name, "users", user, user_password)
    self.connect_to_database(database_name)
    record = @@database_connection.exec( "SELECT chitter_id, chitter, posted_at FROM #{database_table} " +
    "WHERE user_id = '#{user_id.to_a[0]["user_id"]}' " +
    "ORDER BY posted_at DESC;")
    record_content = record.map do |messages|
      [messages['chitter_id'], messages['chitter'], messages['posted_at']]
    end
  end

  def self.add_message(database_name, database_table, chitter_message, user, user_password)
    user_id = self.get_user_id(database_name, "users", user, user_password)
    self.connect_to_database(database_name)
    @@database_connection.exec( "INSERT INTO #{database_table} (user_id, chitter) VALUES" +
    " ('#{user_id.to_a[0]["user_id"]}', '#{chitter_message}');")
    self.close_database_connection
  end

  def self.get_user_id(database_name, database_table, user, user_password)
    self.connect_to_database(database_name)
    search_user_query = "SELECT (user_id) FROM #{database_table} " +
    "WHERE user_name = '#{user}' AND password = '#{user_password}';"
    user_id = @@database_connection.exec(search_user_query)
    self.close_database_connection
    user_id
  end

  def self.close_database_connection
    @@database_connection.close
  end

end
