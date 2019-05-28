require 'pg'

class Peep
  attr_reader :id, :message, :time_sent, :account_id

  def initialize(id, message, time_sent, account_id)
    @id = id
    @message = message
    @time_sent = time_sent
    @account_id = account_id
  end

  def self.add(message, account_id)
    check_edge_cases(message)
    database.exec("INSERT INTO peep (message, account_id) VALUES('#{message}', '#{account_id}');")
  end

  def self.all
    database.exec("SELECT * FROM peep")
    data = database.exec( 'SELECT * FROM peep;' )
    data.map do |peep|
      self.new(peep['id'], peep['message'], format_timestamp(peep['sent_at']), look_up_name(peep['account_id']))
    end
  end

private

  def self.database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.check_edge_cases(message)
    raise ('Messages cannot be empty.') if message.length == 0
    raise ('Messages over 140 characters not allowed.') if message.length > 140
  end

  def self.format_timestamp(time_sent)
    time = time_sent.split('.')
    time[0]
  end

  def self.look_up_name(id)
    p "id is #{id}"
    data = database.exec("SELECT handle FROM account WHERE id = #{id};")
    data[0]['handle']
  end

end
