require 'pg'

class ChitterDatabase

  def self.connect_to_database(database_name)
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: "chitter_test")
    else
      PG.connect(dbname: "#{database_name}")
    end
  end

  def self.check_user_details(database_name, database_table, user, user_password)
    database_connection = self.connect_to_database(database_name)
    search_user_query = "SELECT (user_id) FROM #{database_table} " +
    "WHERE user_name = '#{user}' AND password = '#{user_password}';"
    user_exists = database_connection.exec(search_user_query)
    if user_exists.to_a.any?
      database_connection.close
      return true
    else
      database_connection.close
      return false
    end
  end

  def self.add_new_user(database_name, database_table, new_user, new_user_password)
    database_connection = self.connect_to_database(database_name)
    database_connection.exec( "INSERT INTO #{database_table} (user_name, password) VALUES" +
    " ('#{new_user}', '#{new_user_password}');")
    database_connection.close
  end

  def self.view_table(database_name, database_table, user, user_password)
    database_connection = self.connect_to_database(database_name)
    #database_table == "chitter_messages_test" if database_name == "chitter_test"
    user_id = self.get_user_id(database_name, "users", user, user_password)
    record = database_connection.exec( "SELECT chitter FROM #{database_table} WHERE user_id = '#{user_id.to_a[0]["user_id"]}';")
    record_content = record.map do |messages|
      [messages['chitter_id'], messages['chitter']]
    end
  end

  def self.add_message(database_name, database_table, chitter_message, user, user_password)
    database_connection = self.connect_to_database(database_name)
    user_id = self.get_user_id(database_name, "users", user, user_password)
    database_connection.exec( "INSERT INTO #{database_table} (user_id, chitter) VALUES" +
    " ('#{user_id.to_a[0]["user_id"]}', '#{chitter_message}');")
    database_connection.close
  end

  def self.get_user_id(database_name, database_table, user, user_password)
    database_connection = self.connect_to_database(database_name)
    search_user_query = "SELECT (user_id) FROM #{database_table} " +
    "WHERE user_name = '#{user}' AND password = '#{user_password}';"
    user_id = database_connection.exec(search_user_query)
    database_connection.close
    user_id
  end

end
