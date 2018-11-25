require_relative 'database_connection'
require 'bcrypt'
class User
	attr_reader :id, :name
	def initialize(id:, name:)
		@id = id
		@name = name
	end

	def self.create(name:, u_name:, email:, password:)
		encrypted_password = BCrypt::Password.create(password)
		result = DatabaseConnection.query("INSERT INTO users (name, u_name, email, password) VALUES('#{name}', '#{u_name}', '#{email}', '#{encrypted_password}') RETURNING id, name;")
		User.new(id: result[0]['id'], name: result[0]['name'] )
	end

	def self.find(id:)
		return nil unless id
		result = DatabaseConnection.query("SELECT id, name FROM users WHERE id = #{id};")
		User.new(id: result[0]['id'], name: result[0]['name'] )
	end

	def self.authenticate(email:, password:)
		result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
		return unless result.any?
		return unless BCrypt::Password.new(result[0]['password']) == password
		User.new(id: result[0]['id'], name: result[0]['name'])
	end
end