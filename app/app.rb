require 'sinatra/base'
require_relative "./datamapper_setup"

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do 
    erb(:index)
  end

  get '/:value' do 
    params['value'] = session['value']
  end

  get '/users/new' do 
    erb(:new_user)
  end

  post '/users' do 
    @username = params[:username]
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    erb(:registered)
    session[:user_id] = user.id
    p params
    p session
    redirect to('/')

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end

