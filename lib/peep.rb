require 'pg'

class Peep
  def self.add_peep(user, message)
    DatabaseConnection.query("INSERT INTO peeps(time, user, message) VALUES('#{Time.new.to_s[0..-7]}', '#{user}', #{message});")
  end
end
