require 'pg'
class Peep
	attr_accessor :id, :content, :create_date

	def initialize(id:, content:, create_date:)
		@id = id
		@content = content
		@create_date = create_date
	end 

	 def self.all
 		 	result = set_up.exec("SELECT * FROM chitters;")
			result.map do |chitter|
			Peep.new(id: chitter["id"], content: chitter["content"], create_date: chitter["create_date"])
	 end
	end 

	 def self.create(content:, create_date: Time.new.strftime("%H:%M:%S"))
			result = set_up.exec("INSERT INTO chitters (content, create_date) VALUES('#{content}', '#{create_date}') RETURNING id, content, create_date;")
			Peep.new(id: result[0]["id"], content: result[0]["content"], create_date: result[0]["create_date"])
	 end
	 
	 def self.set_up
  		if ENV["ENVIRONMENT"] == "test"
   			 con = PG.connect(dbname: "chitter_test")
  		else
    		con = PG.connect(dbname: "chitter")
  		end
		end
end
