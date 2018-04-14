require 'pg'
require_relative './peep.rb'

module Database_interface

  def connection
    PG.connect :dbname => ENV['DATABASE']
  end

  def view_peeps
  @peeps = connection.exec("SELECT * FROM peeps").map do |row|
    Peep.new(row['id'], row['poster'], row['time'], row['content'])
    end
  end

end
