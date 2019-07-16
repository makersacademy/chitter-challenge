require 'pg'

class Peep

  def self.connection
    @connection ||= PG.connect(dbname: 'chitter')

  # ||= what id does is: first our variable is nill so it is false,
  # hence our code is looking on the right side. Now if we are going to call
  # connection anywhere it will only open one connection istead of multiple
  # and use that one connetion.

  def self.message
    result = connection.exec("SELECT * FROM messages;")
    result.map{ |message| message['url'] }
  end

end
