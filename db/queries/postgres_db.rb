require 'dotenv'
require 'pg'
require_relative '../../lib/message'

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

  def self.create_message(user_id:, message:)
    result = @con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2) RETURNING *;", [user_id, message])
    result.map { |row| Message.new(id: row['id'], message: row['message'], create_date: row['createdate']) }
  end

  def self.create_user(username: , email: , password: )
    @con.exec_params("INSERT INTO users (user_name, email, password) VALUES ($1,$2,$3) RETURNING *;", [username, email , password]).first
  end

  def self.get_user(id)
    @con.exec_params("SELECT * FROM users WHERE id = $1;", [id]).first
  end

end