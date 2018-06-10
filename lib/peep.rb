require 'pg'
class Peep
  attr_reader :id, :content
  def initialize(id, content)
    @id = id
    @content = content
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    connection = connect_to_database
    result = connection.exec("SELECT * FROM peeps")
    result.map{|peep| Peep.new(peep['id'], peep['content'])}
  end

  def self.create(options)
    connection = connect_to_database
    result = connection.exec("INSERT INTO peeps (content) VALUES ('#{options[:content]}') RETURNING id, content")
    Peep.new(result.first['id'], result.first['content'])
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
