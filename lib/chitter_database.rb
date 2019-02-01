require 'pg'

class ChitterDatabase

  def self.connect_to_database(database_name)
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: "chitter_test")
    else
      PG.connect(dbname: "#{database_name}")
    end
  end

  def self.view_table(database_name, database_table)
    database_table == "chitter_messages_test" if database_name == "chitter_test"
    p database_name
    record = database_name.exec( "SELECT messages FROM #{database_table};")
    record.map do |messages|
      record_content = [messages['id'], messages['messages']]
    end
  end

  def self.add_message(database_name, database_table, chitter_message)
    database_name.exec( "INSERT INTO #{database_table} (messages) VALUES ('#{chitter_message}');")
  end

end
