require 'pg'
require 'user'

class Peep

  attr_reader :message, :username, :created_on

  def initialize(message, username, created_on)
    @message = message
    @username = username
    @created_on = created_on
  end

  # def all
  #   ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
  #   connection = PG.connect(dbname: db)
  #   result = connection.exec('SELECT * FROM peeps')
  #   result.map { |peep| peep['id'], peep['message'], peep['username'], peep['created_on'] }
  # end

  def create
    ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
    connection = PG.connect(dbname: db)
    connection.exec "INSERT INTO peeps (message, username, created_on)
      VALUES ('#{message}}', '#{username}', '#{created_on}')"
  end

end
