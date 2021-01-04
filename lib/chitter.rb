require 'pg'
require_relative './peep'
require_relative './database_connection'
require_relative '../database_connection_setup.rb'

class ChitterDB

  def self.list
    list = []
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.each do |peep|
      list << peep
    end
    list.sort_by { |peep| peep['time'] }
    list.reverse
  end

end
