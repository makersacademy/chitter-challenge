require_relative 'database_connection'
require 'date'

class Peep
  attr_reader :id, :post, :time

  def initialize(id:, post:, time:)
    @id = id
    @post = post
    @time = Time.parse(time).strftime("%d %B %Y, at %k:%M")
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * FROM peeps
       ORDER BY peep_time DESC;")

    result.map do |peep|
      Peep.new(
        id: peep['id'],
        post: peep["peep"],
        time: peep["peep_time"]
      )
    end
  end

  def self.create(post:)
    post = DatabaseConnection.query(
      "INSERT INTO peeps (peep)
       VALUES('#{post}')
       RETURNING id, peep, peep_time;")

    Peep.new(
      id: post[0]['id'],
      post: post[0]["peep"],
      time: post[0]["peep_time"]
    )
  end
end
