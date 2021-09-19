require 'dotenv'
require 'pg'
require_relative '../../lib/message'
require_relative '../../lib/reply'
require 'Time'
class PGDatabase 

  Dotenv.load
  
  def self.connect(db)
    begin
      @con = PG.connect :dbname => db, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
    rescue PG::Error => e
      puts e.message 
    end 
  end

  def self.con
    @con
  end

  def self.get_replies(id)
    result = @con.exec_params("SELECT u.user_name, r.* FROM reply r JOIN users u ON u.id = r.id_users WHERE ID_MESSAGE = $1 ORDER BY createdate DESC", [id])
    arr = []
    result.each { |row| 
      arr << Reply.new(id: row['id'], message: row['message'], create_date: parse_date(row['createdate']), username: row['user_name'], message_id: row['id_message'])
    }
    return arr
  end

  def self.create_message(user_id:, message:)
    result = @con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2) RETURNING *;", [user_id, message])
    username = @con.exec_params("SELECT user_name FROM users WHERE ID = $1;", [user_id])
    result.map { |row| Message.new(id: row['id'], message: row['message'], create_date: row['createdate'], username: username) }
  end

  def self.create_reply(user_id:, message_id:, message:)
    result = @con.exec_params("INSERT INTO reply (id_users, id_message, message) VALUES ($1,$2,$3) RETURNING *", [user_id, message_id, message])
    username = @con.exec_params("SELECT user_name FROM users WHERE ID = $1;", [user_id])
    result.map { |row| Reply.new(id: row['id'], message: row['message'], create_date: row['create_date'], username: username, message_id: row['id_message'])}
  end

  def self.create_user(username: , email: , password: )
    @con.exec_params("INSERT INTO users (user_name, email, password) VALUES ($1,$2,$3) RETURNING *;", [username, email , password]).first
  end

  def self.get_user(idendifier: , value: )
    if idendifier == :id 
      @con.exec_params("SELECT * FROM users WHERE id = $1;", [value]).first
    else
      @con.exec_params("SELECT * FROM users WHERE email = $1;", [value]).first
    end
  end

  def self.parse_date(date)
    if date 
      ruby_date = Time.parse(date)
      ruby_date.strftime("%d-%m-%y %H:%M")
    end
  end

  private_class_method :parse_date

end