require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  enable :sessions
  enable :partial_underscores

  set :session_secret, 'super secret'
  set :views, proc { File.join(root, '..', 'views') }
  set :partial_template_engine, :erb

  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new( name: params[:name],
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
    @username = nil
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
      erb 'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye!"
    redirect '/'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    if session[:user_id]
      Peep.create(heading: params[:heading],
                  message: params[:message],
                  user_id: session[:user_id])
      redirect '/'
    else
      flash.next[:notice] = "You need to sign in to peep!"
      redirect '/'
    end
  end

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end

end
