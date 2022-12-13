require 'date'
require 'pg'

class Peep

  attr_reader :content, :user_id, :time_posted

  def initialize(time_posted, user_id, content)
   
    @time_posted = time_posted
    @user_id = user_id
    @content = content
  
  end

  def self.all

    @peeps = []

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end    
    peeps = con.exec "SELECT * FROM peeps"
    peeps.each do |row|
      @peeps << Peep.new(row['time_posted'],row['user_id'],row['content'])
    end

    return @peeps
    
  end

  def self.create(content)

    @time_posted = DateTime.now.strftime("%H:%M:%S")

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => "chitter_test"
    else
      con = PG.connect :dbname => "chitter"
    end

    con.exec("INSERT INTO peeps(time_posted, content) VALUES('#{@time_posted}', '#{content}')")
  end

end