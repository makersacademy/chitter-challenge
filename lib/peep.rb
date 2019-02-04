require 'pg'

class Peep
  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map{ |peep| Peep.new(peep['body'], peep['time'], peep['user_id']) }.reverse
  end

  def self.add(new_peep, user = nil)
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    anon_user = User.find_or_create_anon_user
    user = (anon_user).id if  user == nil
    DatabaseConnection.query("INSERT INTO peeps(body, time, user_id) VALUES('#{new_peep}', '#{time}', '#{user}');")
  end

  attr_reader :body, :time, :user

  def initialize(body, time, user)
    @body = body
    @time = time
    @user = user
  end

end
