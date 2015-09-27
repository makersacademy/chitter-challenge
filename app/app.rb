require 'sinatra/base'
require 'sinatra/partial'

require_relative 'app_helpers'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions
  set :session_secret, 'super secret'
  helpers ChitterHelpers

  get '/' do
    @topbox = current_user ? :peepform : :welcome
    @peeps = Peep.all
    erb :index
  end

  post '/send-peep' do
    Peep.create(message: params[:message], user: current_user) unless params[:message].empty?
    redirect '/'
  end

  get '/sign-up' do
    @topbox = :sign_up
    @peeps = Peep.all
    erb :index
  end

  post '/sign-up' do
    user = User.create(name: params[:name], email: params[:email],
      password: params[:password], handle: params[:handle])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/log-in' do
    @topbox = :log_in
    @peeps = Peep.all
    erb :index
  end

  post '/log-in' do
    user = User.first(handle: params[:handle])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
