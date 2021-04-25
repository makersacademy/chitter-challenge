require_relative 'database_connection'

class Peep
  attr_reader :text, :time

  def initialize(args = {})
    @user = args[:user] || 'Anonymous'
    @text = args[:text]
    @time = args[:time]
  end 
  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(text: peep['text'], time: peep['time_stamp']) }.reverse
  end  

  def self.create(args = {})
    time = Time.new.strftime("%k:%M on %d/%m/%Y") 
    DatabaseConnection.query("INSERT INTO peeps (text,user_id,time_stamp) VALUES('#{args[:text]}', '#{args[:user]}', '#{time}')")
  end
end  
