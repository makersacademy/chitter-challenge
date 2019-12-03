require 'pg'

class Peep

  attr_reader :id, :content, :author_name, :author_handle, :time

  def initialize(id, content, author_name, author_handle, time)
    @id = id
    @content = content
    @author_name = author_name
    @author_handle = author_handle
    @time = time
  end

  def self.create(content, author_name = "Marianne", author_handle = "marianneoco", time = Time.now)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'Chitter_test' )
    else
      connection = PG.connect( dbname: 'Chitter' )
    end
    result = connection.exec("INSERT INTO peeps (content, author_name, author_handle, time)
      VALUES('#{content}', '#{author_name}', '#{author_handle}', '#{time}')
      RETURNING id, content, author_name, author_handle, time")
    Peep.new(result[0]['id'], result[0]['content'], result[0]['author_name'], result[0]['author_handle'], result[0]['time'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'Chitter_test' )
    else
      connection = PG.connect( dbname: 'Chitter' )
    end
    result = connection.exec "SELECT * FROM peeps"
    result.map { |peep| Peep.new(peep['id'], peep['content'], peep['author_name'], peep['author_handle'], peep['time'])}
  end

end
