require 'sinatra/base'
require 'sinatra/formkeeper'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions
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
      field :name, :present => true, :length => 4..50
      field :mail, :present => true, :email => true
      field :password, :present => true, :length => 4..140
    end
    if form.failed?
      erb(:'users/new')
    else
      user = User.create(name: form[:name], email: form[:mail],
      password: form[:password])
      session[:user_id] = user.id
      redirect '/'
    end
  end
  
  run! if app_file == $PROGRAM_NAME
end
