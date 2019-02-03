require 'pg'

class Peep
  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map{ |peep| Peep.new(peep['body'], peep['time'], peep['user_id']) }.reverse
  end

  def self.add(new_peep, user = User.add_new(name: "Anonymous", email: "Anon", password: "Anon"))
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  #  DatabaseConnection.query("INSERT INTO peeps(body, time, user_id) VALUES('#{new_peep}', '#{time}', '#{user}');")
    DatabaseConnection.query("INSERT INTO peeps(body, time) VALUES('#{new_peep}', '#{time}');")
  end

  attr_reader :body, :time, :user

  def initialize(body, time, user)
    @body = body
    @time = time
    @user = user
  end

  # def return_name
  #   new = User.find(user)
  #   p new
  #   new.name
  # end

end
