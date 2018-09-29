require_relative 'database_connection'
require_relative 'user'
require_relative 'peep'
require_relative 'peepesque'

class Comment

  include Peepesque

  attr_reader :text, :time, :username, :name, :peep_id

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peep_comments")
    rs.map { |c| Comment.new(c) }
  end

  def self.create(text, peep_id, user_klass = User)
    user_id = user_klass.active.id
    query = "INSERT INTO peep_comments (user_id, body, time, peep_id) "\
          "VALUES ('#{user_id}', '#{text}', '#{Time.new}', '#{peep_id}')" \
          "RETURNING id, body, user_id, time, peep_id;"
    rs = DatabaseConnection.query(query)
    Comment.new(rs[0])
  end

  def initialize(args)
    time = Time.parse(args['time'])
    @peep_id = args['peep_id']
    @user_id = args['user_id']
    @username, @name = get_user_detail(args['user_id'])
    @text = args['body']
    @time = time
  end

end
