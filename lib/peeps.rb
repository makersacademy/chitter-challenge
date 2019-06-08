require 'pg'

class Peeps
  attr_reader :peeps, :date
  # def initialize(peep, user_name, timestamp = nil)
  def initialize(peeps, date)
    @peeps = peeps
    @date = date
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'prod'
                  PG.connect(dbname: 'chitter')
                else
                  PG.connect(dbname: 'chitter_test')
                end
    result = connection.exec('SELECT * FROM peeps;')
    result.reverse_each.map { |peeps| Peeps.new(peeps['peeps'], peeps['datenow']) }
    #  include one to many relationship
  end

  def self.create(peep, date_now)
    connection = if ENV['ENVIRONMENT'] == 'prod'
                 PG.connect(dbname: 'chitter')
                 else
                 PG.connect(dbname: 'chitter_test')
                 end
    connection.exec("INSERT INTO peeps (peeps, datenow) VALUES('#{peep}', '#{date_now}');")
  end

  # def time(timestamp)
  #   DateTime.parse(timestamp).strftime("%d/%m/%Y %H:%M")
  # Change to string or not
  #  need to code to html screen
  # end

end