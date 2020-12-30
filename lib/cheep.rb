require 'pg'

class Cheep

  attr_reader :id, :author, :message

  def initialize(id:, author:, message:)
    @id = id
    @author = author
    @message = message

  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cheeps_test_database')
    else
      connection = PG.connect(dbname: 'cheeps')
    end

    result = connection.exec("SELECT * FROM cheeps;")
    result.map do |cheep|
      Cheep.new(id: cheep['id'], author: cheep['author'], message: cheep['message'])
    end
  end

  def self.create(message:, author:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cheeps_test_database')
    else
      connection = PG.connect(dbname: 'cheeps')
    end
  
   
    result = connection.exec("INSERT INTO cheeps (message, author) VALUES('#{message}', '#{author}') RETURNING id, message, author")
    Cheep.new(id: result[0]['id'], author: result[0]['author'], message: result[0]['message'])
  end

end
