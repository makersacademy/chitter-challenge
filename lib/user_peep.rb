require_relative 'database_connection'
require_relative 'peep'
require_relative 'user'

class UserPeep 
	attr_reader :user_id, :peep_id
	

	def initialize(user_id:, peep_id: )
		@user_id = user_id
		@peep_id = peep_id
		@@pairs = []
	end


	def self.create(user_id:, peep_id:)
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end

    result = DatabaseConnection.query("INSERT INTO userspeeps (user_id, peep_id)
     VALUES ($1, $2) RETURNING user_id, peep_id;", [user_id, peep_id])

    UserPeep.new(
			user_id: result[0]['user_id'], 
			peep_id: result[0]['peep_id']
		)
  end

	def self.add
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end

		userpeeps = DatabaseConnection.query("SELECT * FROM userspeeps;")

  	userpeeps.map do |userpeep|
      UserPeep.new(user_id: userpeep['user_id'], peep_id: userpeep['peep_id'])
    end

    userpeeps.each do |userpeep|
      @@pairs.push([userpeep['user_id'], userpeep['peep_id']])
    end
		
	
	end

	def self.add_users
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end

		DatabaseConnection.query("SELECT * FROM users;").map do |user|
      new_user = User.new(id: user['id'], email: user['email'])
			@@pairs.map do |item|
				if item[0] == new_user.id
					item[0] = new_user.email
				end
			end
    end
	end

	def self.add_peeps
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end


		DatabaseConnection.query("SELECT * FROM peeps;").map do |peep|
      new_peep = Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
			@@pairs.map do |item|
        if item[1] == new_peep.id
          item[1] = new_peep.message
          item[2] = new_peep.time
        end
      end
    end
	end

	def self.view_all
		UserPeep.new(user_id: 1, peep_id: 1)
		UserPeep.add
		UserPeep.add_users
		UserPeep.add_peeps
		@@pairs
	end
end


