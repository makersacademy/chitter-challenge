class User
	attr_reader :email, :user_name, :username

	def initialize(email, name, username)
		@email = email.to_s
		@user_name = name.to_s
		@username = username.to_s
	end

	def self.convert_to_user(data)
		email = data["email"]
		user_name = data["name"]
		username = data["username"]

		return User.new(email, user_name, username)
	end

end