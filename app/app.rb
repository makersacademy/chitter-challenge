require 'sinatra/base'
require_relative "./datamapper_setup"

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do 
    erb(:index)
  end

  get '/users/new' do 
    erb(:new_user)
  end

  post '/users' do 
    p params
    p session
    user = User.create(
                        name:                     params[:name], 
                        username:                 params[:username], 
                        email:                    params[:email], 
                        password:                 params[:password],
                        password_confirmation:    params[:password_confirmation]
                      )
    session[:user_id] = user.id
    redirect '/feed'
  end

  get '/feed' do
    @current_user ||= User.get(session[:user_id])
    erb(:feed)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  run! if app_file == $0

end

