require_relative 'user'
require 'date'

class Peep

  attr_reader :handle, :content, :time, :date

  def initialize(handle, content, time, date)
    @handle = handle
    @content = content
    @time = Time.parse(time).strftime('%H:%M')
    @date = Date.parse(date).strftime('%a %d %b %Y')
  end

  def self.add(content, time = Time.now, date = Date.today, user = User.instance.id)
    return if content.chomp.size.zero?
    
    DBConnect.query(add_item_to_db(content, time, date, user))
  end

  def self.feed
    DBConnect.query(join_table).map do |peep| 
      Peep.new(peep['handle'], peep['content'], peep['time'], peep['date'])
    end
  end

  def self.add_item_to_db(content, time, date, user_id)
    "INSERT INTO peeps (content, time, date, user_id) "\
    "VALUES ('#{content}', '#{time}', '#{date}', '#{user_id}')"
  end

  def self.join_table
    "SELECT handle, content, time, date "\
    "FROM users INNER JOIN peeps "\
    "ON users.id = peeps.user_id "\
    "ORDER BY date DESC, time DESC"
  end

end
