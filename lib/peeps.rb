require 'pg'
require_relative '../database_connection_setup.rb'

class Peeps

  attr_reader :peep_id, :time_stamp, :user_id, :peep

  def initialize(peep_id: , time_stamp:, user_id:, peep:) 
    @peep_id = peep_id
    @time_stamp = time_stamp
    @user_id = user_id
    @peep = peep
  end
  
  def self.create(user_id:, peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (user_id, peep, time_stamp) VALUES ($1, $2, NOW()) RETURNING id, time_stamp, user_id, peep;",
      [user_id, peep]
    )
    Peeps.new(
      peep_id: result[0]['id'],
      time_stamp: result[0]['time_stamp'],
      user_id: result[0]['user_id'],
      peep: result[0]['peep']
    )
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * FROM peeps;",
      []
    )
    result.map do |peep|
      Peeps.new(
        peep_id: peep['id'],
        time_stamp: peep['time_stamp'],
        user_id: peep['user_id'],
        peep: peep['peep']
      )
    end
  end

end
