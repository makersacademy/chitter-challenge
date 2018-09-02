require_relative 'database_connection'
require_relative 'user'
require_relative 'peep'
require_relative 'peepesque'

class Comment

  include Peepesque

  attr_reader :text, :time, :username, :name

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM pcomments")
    rs.map{ |com| Comment.new(com['user_id'], com['comment'], com['time'], com['peep_id']) }
  end

  def self.create(text, peep_id, user_klass = User)
    user_id = user_klass.active.id
    rs = DatabaseConnection.query("INSERT INTO pcomments (user_id, comment, time, peep_id) VALUES ('#{user_id}', '#{text}', '#{Time.new}', '#{peep_id}') RETURNING id, comment, user_id, time, peep_id;")
    Comment.new(rs[0]['user_id'], rs[0]['comment'], rs[0]['time'], rs[0]['peep_id'])
  end

  def initialize(user_id, text, time, peep_id)
    time = Time.parse(time)
    @peep_id = peep_id
    @user_id = user_id
    @username, @name = get_user_detail(user_id)
    @text = text
    @time = time
  end

end
