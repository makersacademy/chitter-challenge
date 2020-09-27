class User

	 attr_reader :id, :email

	 def initialize(id:, email:)
 		 @id = id
 		 @email = email
 	end 

	 def self.create(email:, password:)
 		 result = set_up.exec("INSERT INTO users(email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
 		 User.new(id: result[0]['id'], email: result[0]['email'])
 	end 

	 def self.set_up
  		if ENV["ENVIRONMENT"] == "test"
   		 con = PG.connect(dbname: "chitter_test")
  		else
    	 con = PG.connect(dbname: "chitter")
 		end
 	end 

	 def self.find(id)
 		 result = set_up.exec("SELECT * FROM users WHERE id = id ")
 		 User.new(result[0]['id'], result[0]['email'])
 	end
end
