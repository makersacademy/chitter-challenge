require "sinatra/base"
require "./lib/peep"
require "./lib/timeline"
require "./lib/user"
require "./lib/database"
require "rack"
require "sinatra/flash"

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :method_override, true

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Timeline.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/users' do
    # create the user and then...
    user = User.create(
      email: params['input_email'],
      password: params['input_password'],
      realname: params['input_firstname'],
      username: "@" + params['input_username']
    )
    session[:user_id] = user.id

    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME

end
