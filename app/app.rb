require 'sinatra/base'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'helpers'

class ChitterApp < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Partial
  set :partial_template_engine, :erb
  helpers Helpers

  get '/' do
    @topbox = :welcome
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(message: params[:message]) unless params[:message].empty?
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

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
