require_relative 'database_connection'
require_relative 'user'
require_relative 'peep'
require_relative 'peepesque'

class Comment

  include Peepesque

  attr_reader :text, :time, :username, :name, :peep_id

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peep_comments")
    rs.map { |c| Comment.new(c['user_id'], c['body'], c['time'], c['peep_id']) }
  end

  def self.create(text, peep_id, user_klass = User)
    user_id = user_klass.active.id
    query = "INSERT INTO peep_comments (user_id, body, time, peep_id) "\
          "VALUES ('#{user_id}', '#{text}', '#{Time.new}', '#{peep_id}')" \
          "RETURNING id, body, user_id, time, peep_id;"
    rs = DatabaseConnection.query(query)
    p rs[0]['body']
    Comment.new(rs[0]['user_id'], rs[0]['body'], rs[0]['time'], rs[0]['peep_id'])
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
