require 'pg'
require_relative 'database_connection'

class Shouter
  def self.setup
    @@database = database_connect
  end

  def self.all
    result = []
    output = @@database.query("SELECT * FROM shouts")
    output.map { |shout| result.unshift(shout) }
    result
  end

  def self.shout(shout_content, author = 'Solo')
    time_shouted = Time.now.strftime("%d %B %Y | %k:%M")
    @@database.query("INSERT INTO shouts (author, time_shouted, shout_content) VALUES('#{author}', '#{time_shouted}','#{shout_content}') RETURNING shout_content;")
  end

private
	def self.database_connect
		if ENV['ENVIRONMENT'] == 'test'
	 		DatabaseConnection.setup('shouter_database_test')
		else
  		DatabaseConnection.setup('shouter_database')
		end
	end
end
