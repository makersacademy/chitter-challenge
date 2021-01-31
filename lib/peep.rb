require 'pg'

class Peep

  attr_reader :peep, :created_at

  def initialize(peep:, created_at:)
    @peep = peep
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(peep: peep['peep'], created_at: peep['created_at'])
    end
    .reverse
  end

  def self.create(peep:, created_at: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    connection.exec("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{created_at}')")
  end

end