require 'pg'
require_relative 'database_connect'

class Peep 
  attr_reader :id, :username, :name, :text, :date_time
  def initialize(id:, username:, name:, text:, date_time:)
    @id = id
    @username = username
    @name = name
    @text = text
    @date_time = date_time
  end

  # def self.create_connection
  #   if ENV['ENVIRONMENT']== 'test'
  #     @connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     @connection = PG.connect(dbname: 'chitter')
  #   end
  # end 

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY date_time DESC')
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], name: peep['name'], text: peep['text'], date_time: peep['date_time'])
    end
  end 

  def self.add(name:,username:, text:, date_time:)
    DatabaseConnection.query("INSERT INTO peeps (name,username,text,date_time) 
                      VALUES ('#{name}','#{username}','#{text}', '#{date_time}')")
  end 
end 