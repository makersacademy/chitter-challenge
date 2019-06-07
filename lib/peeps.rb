require 'pg'

class Peeps
  attr_reader :peeps
  # def initialize(peep, user_name, timestamp = nil)
  def initialize(peeps)
    @peeps = peeps
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peeps| Peeps.new(peeps['peeps']) }
    # result.map { |peeps| Peeps.new(peeps['peeps'], peeps['user_id'], peeps['date']) }
    #  include one to many relationship
  end

  # def self.create(peep, user_id)
  # def self.create(peep)
  #   connection = PG.connect(dbname: 'chitter')
  #   connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}');")
  #   # connection.exec("INSERT INTO peeps (peeps, user_name) VALUES('#{peep}', '#{XXXXX}');")
  # end

  # def time(timestamp)
  #   DateTime.parse(timestamp).strftime("%d/%m/%Y %H:%M")
  # Change to string or not
  #  need to code to html screen
  # end

end