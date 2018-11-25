require 'pg'
class Peeps

  attr_reader :message_id, :message_created, :message, :username, :subject

  def initialize(message_id, message_created, message, username, subject)
    @message_id = message_id
    @message_created = message_created
    @message = message
    @username = username
    @subject = subject
  end

  def self.read(val = "ascending")
    result = Peeps.sort(val)
    result.map do |peep|
      Peeps.new(peep['id'], peep['created'],
                peep['message'], peep['username'],
                peep['subject'])
    end
  end

  def self.create(message)
    connection = Peeps.choose_connection
    query = "INSERT INTO peeps (message) VALUES ('#{message}') RETURNING *;"
    result = connection.exec(query)
    Peeps.new(result[0]['id'],
              result[0]['created'],
              result[0]['message'],
              result[0]['username'],
              result[0]['subject'])
  end

  def self.sort(val)
    connection = Peeps.choose_connection
    if val == "descending"
      result = connection.exec("SELECT * FROM peeps ORDER BY created DESC;")
    else
      result = connection.exec("SELECT * FROM peeps;")
    end
    result
  end

  def self.choose_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection
  end

end
