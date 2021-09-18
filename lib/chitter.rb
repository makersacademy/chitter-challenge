require_relative '../db/queries/postgres_db.rb'
class Chitter

  def self.show_all_messages
    ["message A", "message B"]
  end

  def self.create_message(message: )
    PGDatabase.create_message(user_id: 1, message: message)
  end

end