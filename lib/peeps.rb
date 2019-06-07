require 'pg'
class Peeps
  attr_reader :name, :message
  
  def initialize(name, message)
    @name = name
    @message = message
  end
  
  def self.all
    connection = PG.connect(dbname: 'peep_manager')
    result = connection.exec("SELECT user_account.name, message.message FROM user_account INNER JOIN message ON user_account.user_id = message.user_id;")
    result.map {|results|
    Peeps.new(results['name'],results['message'])}

  end

  def self.add_name(name)
    connection = PG.connect(dbname: 'peep_manager')
    puts "*********"
    result = connection.exec("INSERT INTO user_account(name) VALUES('#{name}') RETURNING user_id;")
    result[0]['user_id']
  end

  def self.add_message(message, id)
    connection = PG.connect(dbname: 'peep_manager')
    connection.exec("INSERT INTO message(message, user_id) VALUES('#{message}', #{id});")
  end
  end