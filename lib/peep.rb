require 'pg'
require_relative './database.rb'

class Peep

  def self.all
    result = Database.exec("SELECT * FROM peeps")
    result.sort_by { |peep| peep['peepid'].to_i}.reverse!
  end

  def self.by(username)
    result = Database.exec("SELECT * FROM peeps WHERE username = '#{username}'")
    result.sort_by { |peep| peep['peepid'].to_i}.reverse!
  end

  def self.add(username, name, peep)
    Database.exec("INSERT INTO peeps(username, name, peep, time)
    VALUES('#{username}', '#{name}', '#{peep}', '#{Time.now}')")
  end

end
