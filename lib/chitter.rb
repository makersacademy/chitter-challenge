require 'pg'
require 'bcrypt'

  class Chitter

    attr_reader :id, :message, :email

    #USER ---

    def self.setup(email:, password:)
      encrypted_password = BCrypt::Password.create(password)
      result = DatabaseConnection.query("INSERT INTO users (email, password) 
      VALUES('#{email}', '#{encrypted_password}') 
      RETURNING id, email;")
      User.new(
        id: result[0]['id'],
        email: result[0]['email'])
    end

    def self.find_user(id:)
      return nil unless id
      result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
      User.new(
        id: result[0]['id'],
        email: result[0]['email'])
    end

    #PEEPS ---
    
    def self.create(message:)
      time = Time.new.strftime("%T")
      result = DatabaseConnection.query("INSERT INTO peeps (message, time) 
      VALUES('#{message}', '#{time}') 
      RETURNING id, message, time")
      Peep.new(
        id: result[0]['id'],
        message: result[0]['message'],
        time: result[0]['time']
      )
    end

    def self.all
      result = DatabaseConnection.query('SELECT * FROM peeps')
      result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        time: peep['time']
      )
    end
  end
end