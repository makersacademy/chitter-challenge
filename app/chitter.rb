require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  use Rack::MethodOverride

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/all'
  end


  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(email: params[:email],
                        username: params[:username],
                        name: params[:name],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end