require 'pg'

class Peep

  attr_reader :id, :messages, :time

  def initialize(id:, message:, time:)
    # @id = id
    @messages = message
    @time = time
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("insert into chitter (message, time) values('#{message}', '#{Time.now}') RETURNING id, message, time")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    data = connection.exec('select * from chitter;')
    data.map {|post|
      Peep.new(id: post['id'], message: post['message'], time: post['time'])}
  end

  def self.sort_by
    peeps = Peep.all
    peeps.reverse {|peep| peep.id}
  end

end
