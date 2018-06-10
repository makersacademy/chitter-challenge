require 'pg'
class Peep
  attr_reader :id, :content, :timestamp

  def initialize(id, content, timestamp)
    @id = id
    @content = content
    @timestamp = timestamp
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    connection = connect_to_database
    result = connection.exec("SELECT * FROM peeps")
    chronological = result.map { |peep| Peep.new(peep['id'], peep['content'], peep['timestamp']) }
    chronological.reverse
  end

  def self.create(options)
    connection = connect_to_database
    result = connection.exec("INSERT INTO peeps (content, timestamp) VALUES
    ('#{options[:content]}', '#{Time.now.strftime('%d-%m-%y %H:%M')}') RETURNING id, content, timestamp")
    Peep.new(result.first['id'], result.first['content'], result.first['timestamp'])
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_manager_test')
    else
      PG.connect(dbname: 'chitter_manager')
    end
  end

end
