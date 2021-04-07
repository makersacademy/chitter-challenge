require 'pg'

class Peep

  attr_reader :id,  :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
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
      # p peep - {"id"=>"575", "peep"=>"Salut!", "created_at"=>"2021-04-07 09:31:51+01"}
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end
    .reverse
  end

  def self.create(peep:, created_at: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{created_at}') RETURNING id, peep, created_at")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

end
