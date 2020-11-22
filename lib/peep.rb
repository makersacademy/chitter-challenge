require_relative 'database_connection'

class Peep

  attr_reader :id, :post, :time

  def initialize(id:, post:, time:)
    @id = id
    @post = post
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        post: peep['post'],
        time: Time.parse(peep['time']).strftime("%Y/%m/%d %k:%M")
      )
    end
  end

  def self.create(post:)
    result = DatabaseConnection.query("INSERT INTO peeps (post) VALUES('#{post}') RETURNING id, post, time;")
    Peep.new(id: result[0]["id"], post: result[0]["post"], time: Time.parse(result[0]["time"]).strftime("%Y/%m/%d %k:%M"))
  end
end
