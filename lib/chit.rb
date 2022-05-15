require 'pg'

class Chit

# attr_reader :time
#
#   def initialize(time = Time.new)
#     @time = time
#   end

  def self.all
    # research self
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chits')
    result.map { |chit| content = chit['content'], handle = chit['handle'], time = chit['timestamp']}
  end

  def self.post(handle, chit)
    timestamp = Time.new.strftime "%H:%M:%S %d-%m-%Y"
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("INSERT INTO chits (handle, content, timestamp) VALUES ('#{handle}', '#{chit}', '#{timestamp}');")
  end
end
