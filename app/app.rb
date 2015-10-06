require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  set :views, proc{File.join(root, '..' , 'views')}
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride
  set :static, true
  set :public_folder, '/public'

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/e' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
      if current_user
        erb :'peeps/new'
      else
        flash[:notice] = 'You must be logged in to post a peep!'
        redirect to('/peeps')
      end
  end

  post '/peeps' do
      Peep.create(content: params[:content],
                  username: params[:username],
                  created_at: params[:created_at])
      redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to ('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = 'See you later!'
    redirect('/peeps')
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

end
