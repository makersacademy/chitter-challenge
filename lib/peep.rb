require_relative 'database_connection'

class Peep
  attr_reader :text

  def initialize(args = {})
    @user = args[:user] || 'Anonymous'
    @text = args[:text]
  end 
  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(text: peep['text']) }.reverse
  end  

  def self.create(args = {})
    DatabaseConnection.query("INSERT INTO peeps (text,user_id) VALUES('#{args[:text]}', '#{args[:user]}') RETURNING text, user_id")
  end
end  
