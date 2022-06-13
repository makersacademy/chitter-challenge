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

    result.map { |peep| 
      Peep.new(content: peep['content'],
        time_stamp: peep['time_stamp'])
    }
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end
end

# time = result.map { |peep| peep['created_at'] }
#       together = time + content

# def self.time_stamp
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_chatter_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter_chatter')
  #   end

  #   result.map { |peep| peep['created_at'] }
  # end