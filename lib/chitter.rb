require 'pg'
require 'pry'

class Chitter

  attr_reader :post_id, :user_id, :time, :content

  def initialize(post_id, user_id, time, content)
    @post_id = post_id
    @user_id = user_id
    @time = time
    @content = content
  end

  def self.create(user_id, content)
    conn = db_connect
    res = conn.exec("INSERT INTO peeps (user_id, content, time) VALUES ('#{user_id}', '#{content}', '#{Time.now}') returning *;")[0]
    Chitter.new(res['post_id'], res['user_id'], res['time'], res['content'])
  end

  def self.all_peeps
    conn = db_connect
    res = conn.exec("SELECT * FROM peeps ORDER BY time DESC;")
    res.map { |peep| Chitter.new(peep['post_id'], peep['user_id'], peep['time'], peep['content']) }
  end

  def self.db_connect
    db = ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
    PG.connect(dbname: db)
  end

end
