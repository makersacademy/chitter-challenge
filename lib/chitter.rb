require_relative '../db/queries/postgres_db'
require_relative './message'
require 'Time'
class Chitter

  def self.show_all_messages
    result = PGDatabase.con.exec_params("SELECT u.user_name, m.* FROM message m JOIN users u on u.id = m.id_users ORDER BY createdate DESC;")
    result.map { |row |
      replies = show_replies(row['id'])
      Message.new(id: row['id'], message: row['message'] ,create_date: parse_date(row['createdate']), username: row['user_name'], replies: replies)
    }
  end

  def self.create_message(message: , user_id: )
    PGDatabase.create_message(user_id: user_id, message: message)
  end

  def self.create_reply(user_id:, message_id:, message:)
    PGDatabase.create_reply(user_id: user_id, message_id:message_id, message: message)
  end

  def self.show_replies(id)
    PGDatabase.get_replies(id)
  end

  def self.parse_date(date)
    if date 
      ruby_date = Time.parse(date)
      ruby_date.strftime("%d-%m-%y %H:%M")
    end
  end

  private_class_method :parse_date, :show_replies

end