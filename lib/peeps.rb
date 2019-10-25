require 'pg'

class Peeps

  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def self.all
    connection = PG.connect(dbname: 'Peeps')
    result = connection.exec("SELECT * FROM user_peeps")
    result.map do |peep|
      Peeps.new(message: peep['peep'])
    end
  end

  def self.create(message:)
    connection = PG.connect(dbname: 'Peeps')
    result = connection.exec("INSERT INTO user_peeps (peep) VALUES('#{message}') RETURNING peep;")
    Peeps.new(message: result[0]['message'])
  end


end
