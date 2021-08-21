require_relative 'user'

class Peep

  attr_reader :id, :content, :time, :user_id

  def initialize(id, content, time, user_id)
    @id = id
    @content = content
    @time = time
    @user_id = user_id
  end

  def self.instance
    @peep
  end

  def self.all
    result = DBConnect.query("SELECT * FROM peeps")
    result.map do |peep| 
      Peep.new(peep['id'], peep['content'], peep['time'], peep['user_id'])
    end
  end

  def self.add(content, time=Time.now, user=User.instance.id)
    result = DBConnect.query(query_to_create(content, time, user))
    data = ['id', 'content', 'time', 'user_id'].map { |item| result[0][item] }
    @peep = Peep.new(*data)
  end

  def self.feed
    result = DBConnect.query(query_to_join_table)
    #result.map { |peep| "@#{peep['handle']}: #{peep['content']}" }
    result.map do |peep| 
      feed_string(peep['handle'], peep['content'], peep['time'])
    end
  end

  def self.query_to_create(content, time, user_id)
    "INSERT INTO peeps (content, time, user_id) "\
    "VALUES ('#{content}', '#{time}', '#{user_id}') "\
    "RETURNING id, content, time, user_id"
  end

  def self.query_to_join_table
    "SELECT handle, content, time "\
    "FROM users INNER JOIN peeps "\
    "ON users.id = peeps.user_id"
  end

  def self.feed_string(handle, content, time)
    "@#{handle}: #{content} (posted at #{time})"
  end

end
