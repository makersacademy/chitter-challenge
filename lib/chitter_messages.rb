require_relative 'chitter_database'

class ChitterMessages

  def initialize(database_name, database_table)
    @database = database_name
    @database_table = database_table
  end

  def all(user, user_password)
    ChitterDatabase.view_table(@database, @database_table, user, user_password)
  end

  def add_chitter_message(chitter_message, user, user_password)
    ChitterDatabase.add_message(@database, @database_table, chitter_message, user, user_password)
  end

  def add_new_user(database_name, database_table, new_user, new_user_password)
    ChitterDatabase.add_new_user(database_name, database_table, new_user, new_user_password)
  end

  def log_out
    ChitterDatabase.close_database_connection
  end

end
