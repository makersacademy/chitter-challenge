require'pg'

class Peep

  attr_reader :id, :user_id, :peep, :time

  def initialize(id:, user_id:, peep:, time:)
   @id = id
   @user_id = user_id
   @peep = peep
   @time = time
  end

  def self.time_of_peep
    Time.now.strftime("%m/%d/%Y %H:%M")
  end

  def self.all
    setup_connection
    result = @@connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], user_id: peep['name'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.create(user_id:, peep:)
    setup_connection
    result = @@connection.exec("INSERT INTO peeps (user_id, peep, time) VALUES ('#{user_id}', '#{peep}', '#{Peep.time_of_peep}') RETURNING id, user_id, peep, time;")
    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.where(user_id:)
    setup_connection
    result = @@connection.exec("SELECT * FROM peeps WHERE user_id = #{user_id};")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        user_id: peep['user_id'],
        peep: peep['peep'],
        time: peep['time']
      )
    end
  end

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
