require 'pg'

class Chitter
attr_reader :message

 def initialize(message:)
   @message = message
 end

 def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Twitter_clone_test')
    else
      connection = PG.connect(dbname: 'Twitter_clone')
    end
    result = connection.exec("SELECT * FROM chitter ORDER BY ID DESC")
    result.map do |chitter|
      test = Chitter.new(message: chitter['message'])
    end
  end



  def self.create(message:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Twitter_clone_test')
    else
      connection = PG.connect(dbname: 'Twitter_clone')
    end
    result = connection.exec("INSERT INTO chitter (message) VALUES('#{message}') RETURNING message")
    Chitter.new(message: result[0]['message'])
  end
end
