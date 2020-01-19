require 'pg'

class Peep

  attr_reader :id, :user_name, :user_handle, :peep, :timestamp

  def initialize(id:, user_name:, user_handle:, peep:, timestamp:)
    @id = id
    @user_name = user_name
    @user_handle = user_handle
    @peep = peep
    @timestamp = timestamp
  end

  def self.see_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], user_name: peep['user_name'], user_handle: peep['user_handle'], peep: peep['peep'], timestamp: peep['timestamp'])
    end
  end


  def self.create(user_name:, user_handle:, peep:, timestamp:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("INSERT INTO peeps (user_name, user_handle, peep, timestamp) VALUES ('#{user_name}', '#{user_handle}', '#{peep}', '#{timestamp}') RETURNING id, user_name, user_handle, peep, timestamp")
    Peep.new(id: result[0]['id'], user_name: result[0]['user_name'], user_handle: result[0]['user_handle'], peep: result[0]['peep'], timestamp: result[0]['timestamp'])
  end

end
