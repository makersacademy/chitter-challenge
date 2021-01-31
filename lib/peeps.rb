require 'pg'
# require 'Time'

class Peeps

  attr_reader :id, :peep, :time, :user_id

  def initialize(id:, peep:, time:, user_id:)
    @id = id
    @peep = peep
    @time = time
    @user_id = user_id
  end

  def self.create(peep:, user_id:)
    return nil unless peep

    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, time, user_id;").first
    Peeps.new(id: result["id"], peep: result["peep"], time: Time.parse(result["time"]), user_id: result['user_id'])
  end

  def self.all
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id desc;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['peep'], time: Time.parse(peep['time']), user_id: peep['user_id'])
    end
  end
end
