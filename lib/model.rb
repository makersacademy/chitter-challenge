require 'pg'

class Peep
  attr_reader :peeps, :created_at, :id

  def initialize(peeps:, created_at:, id:)
    @peeps = peeps
    @created_at = created_at
    @id = id
  end 

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM chitter_peeps")
    result.map do |post| 
    Peep.new(id: post['id'], peeps: post['peeps'], created_at: post['created_at'])
    end
  end 

  def self.create(peeps:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("INSERT INTO chitter_peeps (peeps) VALUES ('#{peeps}') RETURNING id, peeps, created_at;")
    Peep.new(id: result[0]['id'], peeps: result[0]['peeps'], created_at: result[0]['created_at'])
  end 
end 

