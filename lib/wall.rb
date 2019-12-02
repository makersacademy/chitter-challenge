require './db/database_connection.rb' # Contains database connection methods
require './lib/peep'

DatabaseConnection.setup('chitter') # Connect to the chitter database

class Wall

  def initialize
    @posts = []
  end

  def self.return_all
    peeps_table = DatabaseConnection.query("SELECT * FROM peeps;")

    peeps_table.map do |row|
      Peep.new(row['id'], row['datetime'], row['username'], row['post'])
    end
  end

  private

  def self.sort(posts)

  end

end
