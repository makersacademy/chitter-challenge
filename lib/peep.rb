require 'pg'

class Peep
  attr_reader :message, :user, :time

  def initialize(message:, user:, time:)
    @message = message
    @user = user
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map do |peep|
      Peep.new(message: peep['message'], user: peep['username'], time: [peep['time']])
    end
  end

  def self.create(message:, user:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("INSERT INTO peeps (message, username, time) VALUES($1, $2, $3);", [message, user, time])
  end
end