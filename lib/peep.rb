# require 'pg'
# require 'database_connection'

class Peep

  attr_reader :id, :post, :time

  def initialize(id, post, time)
    @id = id
    @post = post
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['id'], peep['post'], peep['time']) }
  end

  def self.create(options)
    DatabaseConnection.query("INSERT INTO peeps (post, time) VALUES('#{options}', '#{Time.now}')")
  end
end
