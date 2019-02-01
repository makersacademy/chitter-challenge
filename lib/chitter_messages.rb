require_relative 'chitter_database'

class ChitterMessages

  def initialize(database_name)
    @database = ChitterDatabase.connect_to_database(database_name)
  end

  def all
    ChitterDatabase.view_table(@database, "chitter_messages")
  end

  def add_chitter_message(chitter_message)
    ChitterDatabase.add_message(@database, "chitter_messages", chitter_message)
  end

end
