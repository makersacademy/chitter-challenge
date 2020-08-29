require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :post, :time

  def initialize(id:, post:, time:)
    @id = id
    @post = post
    @time = time
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
    entry = DatabaseConnection.query(
      "INSERT INTO peeps (peep) 
       VALUES('#{post}') 
       RETURNING id, peep, peep_time;")

    Peep.new(
      id: entry[0]['id'],
      post: entry[0]["peep"],
      time: entry[0]["peep_time"]
    )
  end
end
