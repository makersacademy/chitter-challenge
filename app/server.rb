require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative '../app/models/peep' # this needs to be done after datamapper is initialised
require_relative '../app/models/user'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!



class Chitter < Sinatra::Base

  enable :sessions

  get '/' do 
    Peep.create(:message => "Hello there!")
    @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users/welcome' do
    @username = params[:username]
    @password = params[:password]
    User.create(:username => @username,
                :password => @password)
  end

  #start the server if ruby file executed directly
  run! if app_file == $0
end