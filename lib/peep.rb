require_relative 'database_connection'
require_relative 'user'
require_relative 'peepesque'

class Peep

  include Peepesque

  attr_reader :text, :time, :username, :name

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps")
    rs.map{ |peep| Peep.new(peep['user_id'], peep['comment'], peep['time']) }
  end

  def self.create(text, user_klass = User)
    user_id = user_klass.active.id
    rs = DatabaseConnection.query("INSERT INTO peeps (user_id, comment, time) VALUES ('#{user_id}', '#{text}', '#{Time.new}') RETURNING id, comment, user_id, time;")
    Peep.new(rs[0]['user_id'], rs[0]['comment'], rs[0]['time'])
  end

  def initialize(user_id, text, time)
    time = Time.parse(time)
    @user_id = user_id
    @username, @name = get_user_detail(user_id)
    @text = text
    @time = time
  end

end
