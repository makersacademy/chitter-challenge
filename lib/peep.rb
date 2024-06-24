require 'pg'

class Peep 
  attr_reader :id, :timestamp, :post

  def initialize(id:, timestamp:, post:)
    @id = id
    @timestamp = timestamp[0..15]
    @post = post
  end

  def self.all
    result = PGDatabase.select_peeps
    result.map { |peep| 
      Peep.new(id: peep['id'], timestamp: peep['timestamp'], post: peep['post']) 
    }.reverse
  end

  def self.add(post:)
    result = PGDatabase.add_peep(post: post)
    Peep.new(id: result[0]['id'], timestamp: result[0]['timestamp'], post: result[0]['post'])
  end
end