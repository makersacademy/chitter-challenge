require 'pg'
require_relative 'database_connection'

class Peep

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      p peep
      { :message => peep['message'],
        :time => peep['time']
       }
    end
  end

  def self.create(message:)
    DatabaseConnection.query("INSERT INTO peeps (message, time) VALUES('#{message}', '#{(Time.now).strftime("%b %d %k:%M")}')")
  end
end
