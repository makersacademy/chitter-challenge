require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require 'sinatra/base'
require 'sinatra/reloader'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peep_repo.all.sort do |post|
      DateTime.parse(post.time)
    end
    return erb(:index)
  end

  get "/signup" do
    
  end

  get "/login" do
    
  end

  get "/logout" do
    
  end

  post "/peep" do
  
  end



end





# # Perform a SQL query on the database and get the result set.
# sql = 'SELECT * FROM users;'
# result = DatabaseConnection.exec_params(sql, [])

# # Print out each record from the result set .
# result.each do |record|
   
#    p record['name'].include?("Rachel")
# end

