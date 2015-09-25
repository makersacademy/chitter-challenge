require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    @user = User.get(session[:user_id])
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create( name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

end
