require 'pg'
require 'bcrypt'
require_relative './database_connection'

  class Chitter

    attr_reader :id, :message, :email

    #USER ---

    def self.setup_user(email:, password:)
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
      result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
      User.new(
        id: result[0]['id'],
        email: result[0]['email'])
    end

    def self.authenticate_user(email:, password:)
      result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
      return unless result.any?
      return unless BCrypt::Password.new(result[0]['password']) == password
      User.new(
        id: result[0]['id'],
        email: result[0]['email'])
    end

    #PEEPS ---
    
    def self.create_peep(message:)
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

    def self.all_peeps
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