require 'pg'

class Peeps

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.reverse_each.map { |peep| "*****#{peep['message']}***** Time posted: #{peep['time'].to_s[0..-6]}" }
  end

  def self.create(newpeep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    connection.exec("INSERT INTO peeps (message, time) VALUES('#{newpeep}', '#{Time.now}')")
  end

end
