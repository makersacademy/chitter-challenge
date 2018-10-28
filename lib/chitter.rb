require 'pg'
require 'pry'
require_relative './database_connection'

class Chitter

  attr_reader :post_id, :user_id, :time, :content

  def initialize(post_id, user_id, time, content)
    @post_id = post_id
    @user_id = user_id
    @time = time
    @content = content
  end

  def self.create(user_id, content)
    res = DatabaseConnection.query("INSERT INTO peeps (user_id, content, time) VALUES ('#{user_id}', '#{content}', '#{Time.now}') returning *;")
    Chitter.new(res[0]['post_id'], res[0]['user_id'], res[0]['time'], res[0]['content'])
  end

  def self.all_peeps
    res = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    return if res.ntuples == 0
    res.map { |peep| Chitter.new(peep['post_id'], peep['user_id'], peep['time'], peep['content']) }
  end

end
