require 'pg'

class Peep

  attr_reader :content, :time_stamp

  def initialize(content:, time_stamp:)
    @content = content
    @time_stamp = time_stamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    result = connection.exec("SELECT * FROM peeps;")

    message = result.map { |peep| 
      Peep.new(content: peep['content'],
        time_stamp: peep['time_stamp'])
    }
    message.to_s
  end

  def self.create(content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")


  end
end