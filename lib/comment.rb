require 'pg'
require_relative 'database_connection'

class Comment 

  attr_reader :id, :comment, :tweet_id, :user_id

  def initialize(id:, comment:, tweet_id:, user_id:)
    @id = id 
    @comment = comment 
    @tweet_id = tweet_id
    @user_id = user_id
  end 

  def self.where(tweet_id:)
    result = DatabaseConnection.query("SELECT * FROM comment WHERE tweet_id = '#{tweet_id}';")
    result.each { |comment|
      Comment.new(id: comment['id'], comment: comment['comment'], tweet_id: comment['tweet_id'], user_id: comment['user_id'] )
    }
  end 

  def self.create(comment:, tweet_id:, user_id:)
    comment = DatabaseConnection.query("INSERT INTO comment (comment, tweet_id, user_id) VALUES('#{comment}', '#{tweet_id}', '#{user_id}') 
        RETURNING id, comment, tweet_id, user_id;")
    Comment.new(id: comment[0]['id'], comment: comment[0]['comment'], tweet_id: comment[0]['tweet_id'], user_id: comment[0]['user_id'] )
  end 

end 
