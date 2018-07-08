require 'pg'

class Peep

  attr_reader :id, :posts_a_peep

  def initialize(id, posts_a_peep)
    @id = id
    @posts_a_peep = posts_a_peep
  end

  def self.all
    connection = connect_to_database
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['id'], peep['posts_a_peep'])}
  end

  def self.create(options)
    connection = connect_to_database
    result = connection.exec("INSERT INTO peeps (posts_a_peep) VALUES ('#{options[:posts_a_peep]}') RETURNING id, posts_a_peep")
    Peep.new(result.first['id'], result.first['posts_a_peep'])
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_manager_test')
    else
      PG.connect(dbname: 'chitter_manager')
    end
  end
end
