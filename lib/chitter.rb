require_relative 'db_connection'

class Chitter
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    result = DBConnection.query("select * from chitter")
    result.map { |chitter|
      Chitter.new(id: chitter['id'], message: chitter['message'], date: chitter['date'])
    }
  end

  def self.create(message:)
    result = DBConnection.query(
      "insert into chitter (message) values('#{message}') RETURNING id, message, date;"
      )
    Chitter.new(
      id: result[0]['id'], message: result[0]['message'], date: result[0]['date']
      )
  end

  def self.delete(id:)
    DBConnection.query("delete from chitter where id = #{id};")
  end

  def self.edit(id:, message:)
    result = DBConnection.query("UPDATE chitter SET message = '#{message}' WHERE id = #{id} 
    RETURNING id, message, date;")
    Chitter.new(
      id: result[0]['id'], message: result[0]['message'], date: result[0]['date']
      )
  end

  def self.find(id:)
    result = DBConnection.query("SELECT * FROM chitter WHERE id = #{id};")
    Chitter.new(
      id: result[0]['id'], message: result[0]['message'], date: result[0]['date']
      )
  end
end
