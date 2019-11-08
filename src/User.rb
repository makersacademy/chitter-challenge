class User
	attr_reader :email, :name, :username

	def initialize(email, name, username)
		@email = email
		@name = name
		@username = username
	end

	def self.convert_to_user(data)
		return User.new(data['email'], data['name'], 'username')
	end
end