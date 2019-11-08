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

	def self.get_peeps
		@connection = PG.connect(dbname: 'chitter')
		temp = nil
		@connection.exec("SELECT * FROM peeps") do |result|
			result.each do |row|
				temp = row
			end
		end

		return temp
	end

	def self.insert(post)    
		@connection = PG.connect(dbname: 'postsdb')
		@connection.exec("INSERT INTO posts(post, poster, time) VALUES('#{post.post}', '#{post.poster}', '#{post.time}')") 
	end
end
