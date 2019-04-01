require 'pg'
require 'time'
require './lib/database_connection.rb'

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
    result = DatabaseConnection.query("SELECT * FROM chitter ORDER BY time DESC;")

    result.map do |peep|
      Chitter.new(id: peep['id'], name: peep['name'], handle: peep['handle'], time: peep['time'], content: peep['content'])
    end
  end

  def self.create(content:)
    DatabaseConnection.query("INSERT INTO chitter (name, handle, time, content) VALUES ('someone', 'no username', '#{Time.now}', '#{content}');")
  end
end
