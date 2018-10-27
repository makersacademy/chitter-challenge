require'pg'

class Peep

  attr_reader :id, :user, :peep, :time

  def initialize(id:, user_id:, peep:, time:)
   @id = id
   @user_id = user_id
   @peep = peep
   @time = time
  end

  def time_of_peep
    Time.now.strftime("%m/%d/%Y %H:%M")
  end

  def self.all
    setup_connection
    result = @@connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      User.new(id: peep['id'], user_id: peep['name'], peep: peep['peep'], time: peep['time'])
    end
  end

  # def self.create(name:, email:, username:, password:)
  #   setup_connection
  #   result = @@connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
  #   User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  # end
  #
  # def self.find(id:)
  #   setup_connection
  #   result = @@connection.exec("SELECT * FROM users WHERE id = #{id};")
  #   User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  # end

  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect(dbname: 'chitter_test')
    else
      @@connection = PG.connect(dbname: 'chitter')
    end
  end

end
