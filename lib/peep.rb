require_relative 'database_connection'
require_relative 'user'
require_relative 'peepesque'

class Peep

  include Peepesque

  attr_reader :text, :time, :username, :name, :id

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps")
    rs.map { |peep| Peep.new(peep) }
  end

  def self.create(text, user_klass = User)
    user_id = user_klass.active.id
    query = "INSERT INTO peeps (user_id, comment, time) "\
    "VALUES ('#{user_id}', '#{text}', '#{Time.new}') "\
    "RETURNING id, comment, user_id, time;"
    rs = DatabaseConnection.query(query)
    Peep.new(rs[0])
  end

  def initialize(args)
    time = Time.parse(args['time'])
    @user_id = args['user_id']
    @username, @name = get_user_detail(args['user_id'])
    @text = args['comment']
    @time = time
    @id = args['id']
  end

end
