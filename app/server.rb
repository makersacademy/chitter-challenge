require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    @user = User.get(session[:user_id])
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
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

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ["Username or password incorrect"]
      @username = params[:username]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye!"
    redirect '/'
  end

end
