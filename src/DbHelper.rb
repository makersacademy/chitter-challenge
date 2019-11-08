require 'pg'

class DbHelper
	def self.get_exac(email)
		@connection = PG.connect(dbname: 'chitter')
		temp = nil
		@connection.exec("SELECT * FROM users WHERE email='#{email}'") do |result|
			result.each do |row|
				temp = row
			end
		end

		return temp
	end
end
