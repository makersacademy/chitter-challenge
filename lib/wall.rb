require './db/database_connection.rb' # Contains database connection methods
require './lib/peep.rb'

# If rspec test is running, connect to test database
# instead of live one:
if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chittertest')
else
  DatabaseConnection.setup('chitter')
end

class Wall

  def initialize
    @posts = []
  end

  def self.return_all
    peeps_table = DatabaseConnection.query("SELECT * FROM peeps;")

    posts = peeps_table.map do |row|
      Peep.new(row['id'], row['datetime'], row['username'], row['post'])
    end

    sort(posts)
  end

  def self.sort(posts)
    posts.sort_by { |peep| peep.content[:datetime] }.reverse
  end

end
