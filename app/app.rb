require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     name: params[:name],
                     user_name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  run! if app_file == $PROGRAM_NAME
  set :views, proc { File.join(root, 'views') }

end
