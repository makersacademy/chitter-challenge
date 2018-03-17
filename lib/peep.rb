# Peep class, takes care of all peeps
require 'date'
require './lib/database_connection'

class Peep
  attr_reader :peep_id, :user_id, :peep, :time
  def initialize(peep_id, user_id, peep, time)
    @peep_id = peep_id
    @user_id = user_id
    @peep = peep
    @time = time
  end

  def self.show_all
    DatabaseConnection.connect('chitter')
    peeps = DatabaseConnection.query('SELECT * FROM peeps;')
    peeps.map { |p| Peep.new(p['id'], p['user_id'], p['peep'], p['date']) }
  end

  def self.add(user_id, peep)
    DatabaseConnection.connect('chitter')
    DatabaseConnection.query("insert into peeps (user_id, peep) values(#{user_id},'#{peep}');")
  end
end
