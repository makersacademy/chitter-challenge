require 'pg'

class Chitter

  attr_reader :posts, :id, :peep, :time

  def initialize(id, peep, time)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM chitter;')
    result.map { |row| Chitter.new(row['id'], row['peep'], row['time']) }
  end

  def self.post(string)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    tweet = connection.exec("INSERT INTO chitter (peep, time) VALUES('#{string}', '#{Time.now.to_s.delete_suffix(' +0000')}') RETURNING id, peep, time;")
    p tweet
    Chitter.new(tweet[0]["id"], tweet[0]["peep"], Time.now)
  end

end
