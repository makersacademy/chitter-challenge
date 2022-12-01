require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter')

class Application

  def initialize(database_name, io, user_repository, peep_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @user_repository = user_repository
    @peep_repository = peep_repository
  end


  def run
   
    @peep_repository.all.each do |peep|
      puts "#{peep.id} #{peep.content} #{peep.date_time} #{peep.user_id}"
    end

  end

end

peep_repository = PeepRepository.new
user_repository = UserRepository.new
app = Application.new('chitter', Kernel, user_repository, peep_repository)

app.run