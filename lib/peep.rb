require './env'

class Peep

  attr_reader :id, :peep, :username, :time

  def initialize(id, peep, username, time)
    @id = id
    @peep = peep
    @username = username
    @time = time
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map { |element| Peep.new(element['id'], element['peep'], element['username'], element['time']) }
  end

  def self.add(peep, username, time)
    DatabaseConnection.query("INSERT INTO peeps (peep, username, time) VALUES('#{peep}', '#{username}', '#{time}');")
  end


end
