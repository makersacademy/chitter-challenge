require 'pg'
require_relative './database.rb'

class Peep

  def self.all
    result = Database.exec("SELECT * FROM peeps")
    result.sort_by { |peep| peep['id'] }.reverse!
  end

  def self.add(params)
    Database.exec("INSERT INTO peeps(username, name, peep, time)
    VALUES('#{params[:username]}', '#{params[:name]}', '#{params[:peep]}', '#{Time.now}')")
  end

end
