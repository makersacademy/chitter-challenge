require 'pg'
require_relative 'database_connection'

class Peeps

  attr_reader :peep, :time, :id, :user_id

  def initialize(id:, peep:, time:, user_id:)
    @id = id
    @peep = peep
    @time = time
    @user_id = user_id.to_i
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['peep'], time: peep['time'], user_id: peep['user_id'])
    end
  end

  def self.add(peep, user_id = 0)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, time, user_id) 
    VALUES('#{peep}', '#{Time.now}', '#{user_id}') RETURNING id, peep, time, user_id;")

    Peeps.new(id: result[0]['id'], peep: result[0]['peep'], 
      time: result[0]['time'], user_id: result[0]['user_id'])
  end

end
