require 'pg'

class Peep

  attr_reader :id, :message, :user_name, :timeofpeep

  def initialize(id:, message:, user_name:, timeofpeep:)
    @id = id
    @message = message
    @user_name = user_name
    @timeofpeep = timeofpeep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager_2')
    end

    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        user_name: peep['user_name'],
        timeofpeep: peep['timeofpeep']
      )
    end
  end

  def self.create(message:, user_name:, timeofpeep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager_2')
    end

    result = connection.exec("INSERT INTO peeps (message, user_name, timeofpeep) VALUES ('#{message}', '#{user_name}', '#{timeofpeep.strftime("%Y-%m-%d %k:%M")}' ) RETURNING id, message, user_name, timeofpeep;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], user_name: result[0]['user_name'], timeofpeep: result[0]['timeofpeep'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager_2')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id};")
  end

end
