require 'pg'

class Peeps

  attr_reader :message_id, :message_created, :message

  def initialize(message_id:, message_created:, message:, username:, subject:)
    @message_id = message_id
    @message_created = message_created
    @message = message
    @username = username
    @subject = subject
  end

  def self.peep_show
    connection = Peeps.choose_connection
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peeps.new(message_id: peep['id'], message_created: peep['created'],
                message: peep['message'], username: peep['username'],
                subject: peep['subject'])
    end
  end

  def self.save_peep(message)
    connection = Peeps.choose_connection
    query = "INSERT INTO peeps (message) VALUES ('#{message}');"
    connection.exec(query)
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
