require 'pg'

class DbHelper
		def self.get(email)
		@connection = PG.connect(dbname: 'chitter')
		temp = []
		@connection.exec("SELECT * FROM users WHERE email LIKE '%#{email}%'") do |result|
			result.each do |row|
				temp << row
			end
		end

		temp
	end

end
