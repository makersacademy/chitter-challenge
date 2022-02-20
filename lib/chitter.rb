require 'pg'

class Chitter

  attr_reader :peep, :username, :name, :emailaddress, :password
  
  def initialize(peep:, username:, name:, emailaddress:, password:)
    @peep = peep
    @username = username
    @name = name
    @emailaddress = emailaddress
    @password = password
  end

  def self.timeline
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM post ORDER BY date_posted DESC;')
    result.map { |post| post['peep'] }
  end

  def self.post(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO post (peep, date_posted) VALUES ('#{peep}', '#{time = Time.new}')")
  end

  def self.signup(name:, username:, emailaddress:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'account_test')
    else
      connection = PG.connect(dbname: 'account')
    end
    connection.exec("INSERT INTO signup (username, name, emailaddress, password) VALUES ('#{username}', '#{name}', '#{emailaddress}', '#{password}')")
  end
end

