require "pg"
require_relative "db_connection"
require_relative "signup"

class Chitter
  attr_reader :id, :post, :date, :username

  def initialize(id:, post:, date:, username:)
    @id = id
    @post = post
    @date = date
    @username = username
  end

  def self.all
    posts = DBConnection.query("SELECT * FROM posts")
    posts.map do |post|
      Chitter.new(id: post["id"], post: post["post"], date: post["date"], username: post["username"])
    end
  end

  def self.create(post:, date:, username:)
    posts = DBConnection.query("INSERT INTO posts (post, date, username) VALUES('#{post}','#{date}','#{username}') RETURNING id, post, date, username;")
    Chitter.new(
      id: posts[0]["id"],
      post: posts[0]["post"],
      date: posts[0]["date"],
      username: posts[0]["username"],
    )
  end
end
