require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require_relative 'helpers'

# require './app/data_mapper_setup.rb' might have to change back?


class Chitter < Sinatra::Base

  include Helpers
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

# set :public_folder, Proc.new { File.join(root, '..', 'public') }

  get '/' do
    @user = current_user
    erb :homepage
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end


  post '/users' do
    @user = User.create(name:     params[:name],
                        handle:   params[:handle],
                        email:    params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
end


  # get '/' do
  #   if current_user
  #     @post = Post.new
  #     redirect to('/posts')
  #   else
  #     redirect to('/users/new')
  #   end
  # end

  run! if app_file == Chitter
  # run! if app_file == $PROGRAM_NAME

end

