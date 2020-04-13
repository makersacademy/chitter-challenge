require 'pg'

class Messages

  attr_reader :id, :message, :name

  def initialize(id:, message:, name:) #(id:, name:, message:)
    @id = id
    @message = message
    @name = name
  end 

  def self.get_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test');
    else 
      connection = PG.connect(dbname: 'chitter');
    end 
      result = connection.exec('SELECT * FROM peeps')
      result.map do |row| 
        Messages.new(id: row['id'], message: row['message'], name: row['name'])
      end 
  end 
 
  def self.create(message:, name:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'chitter_test');
    else 
      connection = PG.connect(dbname: 'chitter');
    end 
    result = connection.exec("INSERT INTO peeps (message, name) VALUES('#{message}', '#{name}') RETURNING message, name, id ")
    Messages.new(id: result[0]['id'], message: result[0]['message'], name: result[0]['name']) #, message: result[0]['name'], name: result[0]['messsage'])

  end 
end