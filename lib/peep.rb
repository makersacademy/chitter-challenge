require 'pg'
require_relative './database.rb'

class Peep

  def self.all
    Database.exec("SELECT * FROM peeps")
  end

end
