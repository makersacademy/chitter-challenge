require 'pg'
require_relative 'database_connection'
require 'date'

class Peep
  attr_reader :id, :post, :time, :poster, :poster_name

  def initialize(id:, post:, time:, poster:, poster_name:)
    @id = id
    @post = post
    @time = Time.parse(time).strftime("%d %B %Y, at %k:%M")
    @poster = poster
    @poster_name = poster_name
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY peep_time DESC;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        post: peep['peep'],
        time: peep['peep_time'],
        poster: peep['poster'],
        poster_name: peep['poster_name'])
    end
  end

  def self.create(post:, poster:, poster_name:)
    entry = DatabaseConnection.query(
      "INSERT INTO peeps (peep, poster, poster_name) 
        VALUES('#{post}', '#{poster}', '#{poster_name}') 
       RETURNING id, peep, peep_time, poster;")
    Peep.new(
      id: entry[0]['id'],
      post: entry[0]['peep'],
      time: entry[0]['peep_time'],
      poster: entry[0]['poster'],
      poster_name: entry[0]['poster_name'])
  end
end
