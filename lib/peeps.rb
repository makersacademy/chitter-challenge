require 'pg'
require 'date'
require_relative 'database_connection'

class Peeps
  attr_reader :message 
  def initialize(message)
    @message = message
  
  end 

  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter")
    result.map do |chitter| 
      Peeps.new(
        message: chitter['message'],
        id: chitter['id']
        )
    end
  end


  def self.find(id:)
  end

  def self.create(message:)
    time_stamp = Time.now.strftime("%d/%m/%Y") + "-" + Time.now.strftime("%k:%M")
  
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
  
    conn.exec("INSERT INTO chitter (message, time_stamp) VALUES('#{message}', '#{created_on}');")
  end
end



