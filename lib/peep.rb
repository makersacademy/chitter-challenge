require_relative 'database_connection'

class Peep

  attr_reader :time, :post

  def initialize(time:, post:)
    @post  = post
    @time = time
  end

  def self.all
      peeps = DatabaseConnection.query('SELECT * FROM peeps;')
      peeps.map do |peep|
      Peep.new(
        time: peep['time'],
        post: peep['post'],
      )
    end
  end

  def self.create(time:, post:)
    result = DatabaseConnection.query("INSERT INTO peeps (time, post) VALUES('#{Time.now}', '#{post}') RETURNING time, post;")
    Peep.new(time: result[0]['time'], post: result[0]['post'])
  end

end
