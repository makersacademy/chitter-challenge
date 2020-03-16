require 'pg'
require_relative 'peep'
require_relative 'user'

class Chitter

  def self.print_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(peep_id: peep['peep_id'], peep: peep['peep'], post_time: peep['post_time'], post_date: peep['post_date'])
    end
  end

  def self.post_peep(peep:, post_time:, post_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep, post_time, post_date) VALUES('#{peep}', '#{post_time}', '#{post_date}') RETURNING peep_id, peep, post_time, post_date;")
    Peep.new(peep_id: result[0]['peep_id'], peep: result[0]['peep'], post_time: result[0]['post_time'], post_date: result[0]['post_date'])
  end

  def self.sign_up(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING user_id, name, username, email, password;")
    User.new(user_id: result[0]['user_id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end
end
