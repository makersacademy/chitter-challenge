require 'bcrypt'
require_relative 'database_connection'


class User
	attr_reader :id, :email

	def initialize(id:, email:)
		@id = id
		@email = email
	end

	def self.create(email:, password:)
		encrypted_password = BCrypt::Password.create(password)

		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end
	

		result = DatabaseConnection.query(
			"INSERT INTO users (email, password) VALUES ($1, $2) returning id, email;",
			[email, encrypted_password]
		)

		User.new(
			id: result[0]['id'],
			email: result[0]['email'],
		)
	end

	def self.get(id:)
		return nil unless id
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end
		result = DatabaseConnection.query(
			"SELECT * FROM users WHERE id = $1",
			[id]
		)
		User.new(
			id: result[0]['id'], 
			email: result[0]['email'],
		)
	end
end