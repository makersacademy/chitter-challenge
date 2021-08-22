require_relative 'user'

class Peep

  attr_reader :handle, :content, :time

  def initialize(handle, content, time)
    @handle = handle
    @content = content
    @time = time
  end

  def self.instance
    @peep
  end

  def self.add(content, time = Time.now, user = User.instance.id)
    DBConnect.query(add_item_to_db(content, time, user))
  end

  def self.feed
    DBConnect.query(join_table).map do |peep| 
      Peep.new(peep['handle'], peep['content'], peep['time'])
    end
  end

  def self.add_item_to_db(content, time, user_id)
    "INSERT INTO peeps (content, time, user_id) "\
    "VALUES ('#{content}', '#{time}', '#{user_id}') "\
    "RETURNING id, content, time, user_id"
  end

  def self.join_table
    "SELECT handle, content, time "\
    "FROM users INNER JOIN peeps "\
    "ON users.id = peeps.user_id "\
    "ORDER BY time DESC"
  end

end
