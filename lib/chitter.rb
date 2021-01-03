require 'pg'
require_relative './peep'
require_relative './database_connection'

class ChitterDB

  def self.list
    database_connection
    query_to_database_to_select_all_peeps
  end

end
