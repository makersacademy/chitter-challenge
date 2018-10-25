require 'pg'

class Cheet

  attr_reader :id, :user, :cheet, :timestamp

  def initialize(id, user, cheet, timestamp)
    @id = id
    @user = user
    @cheet = cheet
    @timestamp = timestamp
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_database_test')
    else
      conn = PG.connect(dbname: 'chitter_database')
    end
    result = conn.exec("SELECT * FROM cheets")
    result.map do |row|
      Cheet.new(row['id'], row['user'], row['cheet'], row['timestamp'])
    end
  end

  def self.create(cheet)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_database_test')
    else
      conn = PG.connect(dbname: 'chitter_database')
    end
    conn.exec("INSERT INTO cheets (cheet) VALUES ('#{cheet}');")
  end

end
