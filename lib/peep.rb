require "database"

class Peep
  def self.post(post)
    DatabaseConnection.query("INSERT INTO peeps (author, text) VALUES ('#{post[:author]}', '#{post[:text]}')")
  end

  
end
