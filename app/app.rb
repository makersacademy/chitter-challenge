ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

# TODO: separate into different controller files
# TODO: separate into helpers file

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect to '/peeps/all'
  end

  get '/peeps/all' do
    @peeps = Peep.all
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(user: current_user, content: params[:content])
    flash.next[:notice] = 'Your peep has been posted!'
    redirect to '/peeps/all'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username],
                    email: params[:email],
                    name: params[:name],
                    password: params[:password],
                    password_confirmation: params[:pwd_conf])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/peeps/all'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  run! if app_file == $0
end
