require 'pg'
require 'time'

class Chitter
  attr_reader :name, :handle, :time, :content
  def initialize(id:, name:, handle:, time:, content:)
    @id = id
    @name = name
    @handle = handle
    @time = time
    @content = content
  end

  def self.all
    ENV['ENVIRONMENT'] == 'test'? connection = PG.connect(dbname: 'chitter_app_test'): connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec("SELECT * FROM chitter ORDER BY time DESC;")

    result.map do |peep|
      Chitter.new(id: peep['id'], name: peep['name'], handle: peep['handle'], time: peep['time'], content: peep['content'])
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('someone', 'no username', '#{Time.now}', '#{content}');")
  end
end
