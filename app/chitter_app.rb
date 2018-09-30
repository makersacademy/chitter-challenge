require 'sinatra/base'
# require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, "whatevs"
  # register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all.reverse
    erb(:index)
  end

  post '/post' do
    Peep.create(message: params[:new_peep])
    redirect '/'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
      password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end
  
  run! if app_file == $PROGRAM_NAME
end
