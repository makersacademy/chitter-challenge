require 'pg'

class Peeps

  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = DateTime.parse(created_at).strftime("%d/%m/%Y %H:%M")
  end

  def self.all
    set_env
    all_peeps = @conn.exec( "SELECT * FROM peeps ORDER BY id DESC;")
    all_peeps.map { |post| Peeps.new(id: post['id'], peep: post['peep'], created_at: post['created_at']) }
  end

  def self.create(peep:)
    set_env
    result = @conn.exec_params(
      "INSERT INTO peeps(peep) VALUES($1) RETURNING id, peep, created_at;",[peep]
    )
    Peeps.new(id: result[0]['id',], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end
end

private

  def set_env
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect( dbname: 'chitter_test')
    else 
      @conn = PG.connect( dbname: 'chitter')
    end
  end