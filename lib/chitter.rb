require "pg"
require_relative "db_connection"

class Chitter
  attr_reader :id, :post

  def initialize(id:, post:)
    @id = id
    @post = post
  end

  def self.all
    posts = DBConnection.query("SELECT * FROM posts")
    posts.map do |post|
      Chitter.new(id: post["id"], post: post["post"])
    end
  end

  def self.create(post:)
    posts = DBConnection.query("INSERT INTO posts (post) VALUES('#{post}') RETURNING id, post;")
    Chitter.new(id: posts[0]["id"], post: posts[0]["post"])
  end
end
