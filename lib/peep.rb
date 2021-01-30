require 'pg'

class Peep
  attr_reader :id, :user_id, :peep, :time

  def initialize(id:, user_id:, peep:, time:)
    @id = id
    @user_id = user_id
    @peep = peep
    @time = time
  end

  def self.all_peeps
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], user_id: peep['user_id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.new_peep(user_id:, peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (user_id, peep) VALUES(1, '#{peep}') RETURNING id, user_id, peep, time;")
    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'], peep: result[0]['peep'], time: result[0]['time'])
  end
end
