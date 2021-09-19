require_relative '../db/queries/postgres_db'
require_relative './message'
require 'Time'
class Chitter

  def self.show_all_messages
    result = PGDatabase.con.exec_params("SELECT * FROM message ORDER BY createdate DESC;")
    result.map { |row |
      
      Message.new(id: row['id'], message: row['message'] ,create_date: parse_date(row['createdate']))
    }
  end

  def self.create_message(message: , user_id: )
    PGDatabase.create_message(user_id: user_id, message: message)
  end

  def self.parse_date(date)
    if date 
      ruby_date = Time.parse(date)
      ruby_date.strftime("%d-%m-%y %H:%M")
    end
  end

  private_class_method :parse_date

end