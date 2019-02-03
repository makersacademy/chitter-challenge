require 'pg'
require_relative 'env_helper'

class Peeps

  attr_reader :id, :user_name, :peep, :time

  def initialize(id:, user_name:, peep:, time:)
    @id = id
    @user_name = user_name
    @peep = peep
    @time = time
  end

  def self.all
    env_setup
    result = @connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    result.map { |peep| Peeps.new(id: peep['id'], user_name: peep['user_name'], peep: peep['peep'], time: peep['time']) }
  end

  def self.create(peep)
    env_setup
    result = @connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end
