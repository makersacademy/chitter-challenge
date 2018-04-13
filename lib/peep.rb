require 'pg'
require_relative './database.rb'

class Peep

  def self.all
    Database.exec("SELECT * FROM peeps")
  end

  def self.add(params)
    Database.exec("INSERT INTO peeps(username, name, peep, time)
    VALUES('#{params[:username]}', '#{params[:name]}', '#{params[:peep]}', '#{Time.now}')")
  end

end
