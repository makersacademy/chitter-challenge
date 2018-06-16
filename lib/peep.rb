require 'pg'
class Peep
  attr_reader :id, :content, :timestamp, :username

  def initialize(id, content, timestamp, username)
    @id = id
    @content = content
    @timestamp = timestamp
    @username = username
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    connection = connect_to_database
    result = connection.exec("SELECT * FROM peeps")
    chronological = result.map { |peep| Peep.new(peep['id'], peep['content'], peep['timestamp'], peep['username']) }
    chronological.reverse
  end

  def self.create(options)
    connection = connect_to_database
    result = connection.exec("INSERT INTO peeps (content, timestamp, username) VALUES
    ('#{options[:content]}', '#{Time.now.strftime('%d-%m-%y %H:%M')}',
    '#{options[:username]}') RETURNING id, content, timestamp, username")
    Peep.new(result.first['id'], result.first['content'], result.first['timestamp'],
      result.first['username'])
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_manager_test')
    else
      PG.connect(dbname: 'chitter_manager')
    end
  end

end
