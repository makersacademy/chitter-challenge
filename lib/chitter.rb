require "pg"
require_relative "db_connection"

class Chitter
  attr_reader :id, :post, :date

  def initialize(id:, post:, date:)
    @id = id
    @post = post
    @date = date
  end

  def self.all
    posts = DBConnection.query("SELECT * FROM posts")
    posts.map do |post|
      Chitter.new(id: post["id"], post: post["post"], date: post["date"])
    end
  end

  def self.create(post:, date:)
    posts = DBConnection.query("INSERT INTO posts (post, date) VALUES('#{post}','#{date}') RETURNING id, post, date;")
    Chitter.new(id: posts[0]["id"], post: posts[0]["post"], date: posts[0]["date"])
  end
end
