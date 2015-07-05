require 'sinatra/base'

class Chitter < Sinatra::Base

  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do 
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name],
                      email: params[:email])
    user.password = params[:password]
    session[:user_id] = user.id
    redirect '/users'
  end

  helpers do
    def current_user
      user ||= User.first(id: session[:user_id])
    end
  end

end