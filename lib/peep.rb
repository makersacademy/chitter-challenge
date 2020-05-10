require 'pg'

class Peep

  attr_reader :id, :body, :created_at

  def initialize(id:, body:, created_at:)
    @id = id
    @body = body
    @created_at = created_at
  end

  def self.add(body:)
    peep = connect_to_database.exec("INSERT INTO peeps (body, created_at) VALUES('#{body}', '#{Time.now}') RETURNING id, body, created_at;")
    Peep.new(id: peep[0]['id'], body: peep[0]['body'], created_at: peep[0]['created_at'])
  end

  def self.all
    peeps = connect_to_database.exec("SELECT * FROM peeps")
    peeps.map { |peep| Peep.new(id: peep['id'], body: peep['body'], created_at: peep['created_at'])}.reverse
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end