require 'sinatra/base'
require 'sinatra/formkeeper'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, "whatevs"
  register Sinatra::FormKeeper


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
    form do
      field :name, :present => true, :length => 4..8
      field :email, :present => true, :length => 4..20
      field :password, :present => true, :length => 4..12
    end
    if form.failed?
      "Signup failed"
      erb(:'users/new')
    else
      user = User.create(name: form[:name], email: form[:email],
      password: form[:password])
      session[:user_id] = user.id
      redirect '/'
    end
  end
  
  run! if app_file == $PROGRAM_NAME
end
