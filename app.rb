require './database_connection_setup'
require './lib/peep'
require './lib/user'
require 'sinatra'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep/new' do
    erb :write_peep
  end

  get '/user/new' do
    erb :register
  end

  get '/registered' do
    erb :registered
  end

  post '/peep' do
    Peep.create(text: params[:peep])
    redirect to '/'
  end

  post '/user' do
    if params[:password] != params[:confirm_password]
      flash[:notice] = 'Passwords do not match'
      redirect to '/user/new'
    else
      User.create(name: params[:name],
        username: params[:username],
        email: params[:email],
        password: params[:password]
      )
      redirect to '/registered'
    end

  end

  run! if app_file == $0

end
