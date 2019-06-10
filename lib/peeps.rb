require 'pg'
class Peeps
  attr_reader :name, :message, :date
  
  def initialize(name, message, date)
    @name = name
    @message = message
    @date = date
  end
  
  def self.all
    connection = PG.connect(dbname: 'peep_manager')
    result = connection.exec("SELECT user_account.name, user_account.blog_date, message.message FROM user_account 
    INNER JOIN message ON user_account.user_id = message.user_id ORDER BY user_account.blog_date;")
    result.map {|results|
    Peeps.new(results['name'],results['message'],results['blog_date'])}

  end

  def self.add_name(name, date)
    connection = PG.connect(dbname: 'peep_manager')
    p result = connection.exec("INSERT INTO user_account(name, blog_date) VALUES('#{name}', to_date('#{date}','yyyy/mm/dd')) RETURNING user_id;")
    result[0]['user_id']
  end

  def self.add_message(message, id)
    connection = PG.connect(dbname: 'peep_manager')
    connection.exec("INSERT INTO message(message, user_id) VALUES('#{message}', #{id});")
  end
end