require 'pg'

class Peep
  attr_reader  :id, :url
    def initialize(id:, url:)
      @url = url
      @id = id
    end
    
  def self.message
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map{ |message| message['url'] }
  end


  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO messages (url) VALUES('#{url}')")
  end

  def self.delete(id:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  connection.exec("DELETE FROM messages WHERE id = #{id}")
end

end


# ||= what id does is: first our variable is nill so it is false,
# hence our code is looking on the right side. Now if we are going to call
# connection anywhere it will only open one connection istead of multiple
# and use that one connetion.
