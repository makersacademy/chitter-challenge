require 'PG'
require_relative './database_connection'
require_relative './user'

class Peeps
  attr_reader :id, :peep, :time, :user_id

  def initialize(id:, peep:, time:, user_id:)
    @id = id
    @peep = peep
    @time = time
    @user_id = user_id
  end

  def self.list
    Database.query( "SELECT * FROM peeps" ).map do | row |
      Peeps.new(id: row['id'], peep: row['peep'], time: row['time'], user_id: row['user_id'])
    end
  end

  def self.add(peep:, user_id:)
    result = Database.query( "INSERT INTO peeps(peep, time, user_id) VALUES('#{peep}', '#{DateTime.now}', '#{user_id}' ) RETURNING id, peep, time, user_id;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], user_id: result[0]['user_id'])
  end
end
