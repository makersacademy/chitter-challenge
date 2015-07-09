require 'sinatra/base'
require './app/models/peep'
require './app/data_mapper_setup'
require 'data_mapper'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  
set :views, proc { File.join(root, '..', 'views') }

enable :sessions
set :session_secret, 'super secret'

register Sinatra::Flash

  get '/' do
    'Welcome to Chitter!'
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

  post '/users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                username: params[:username],  
                name: params[:name]
                )
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
