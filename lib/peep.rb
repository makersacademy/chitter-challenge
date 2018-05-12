require 'pg'

class Peep
  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.all(peep_class = Peep, connection = connect_to_database)
    result = connection.exec 'SELECT * FROM peeps'
    result.map { |row| peep_class.new(row['id'], row['text'], row['time']) }
  end

  def self.create(text, connection = connect_to_database)
    connection.exec "INSERT INTO peeps(text, time) VALUES('#{text}', '#{Time.now}')"
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'chitter_test'
    else
      PG.connect dbname: 'chitter'
    end
  end
end
