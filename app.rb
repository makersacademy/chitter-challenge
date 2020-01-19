require 'sinatra/base'
require './lib/peep_list'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/register' do
    User.add(params[:current_username])
    redirect '/login'
  end

  get '/login' do
    @peeps = PeepList.get_peeps
    erb :login
  end

  post '/login' do
    @current_username = params[:current_username]
    if User.exists?(@current_username)
      session[:current_username] = @current_username
      redirect '/send'
    else 
      redirect '/login'
    end
  end

  get '/send' do
    @peeps = PeepList.get_peeps
    @current_username = session[:current_username]
    erb :send
  end

  post '/logout' do
    session[:current_username] = nil
    redirect '/login'
  end


  post '/add_peep' do
    PeepList.add_peep(session[:current_username],params[:message])
    redirect '/send'
  end

  run! if app_file == $0
end