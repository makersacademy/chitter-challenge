ENV['RACK_ENV'] ||= 'development'

require_relative 'app_helpers'
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require 'time'

class Chitter < Sinatra::Base
  enable :sessions
  enable :secret_sessions, 'secret'
  register Sinatra::Flash

  get '/' do
    redirect '/welcome'
  end

  get '/home' do
    @peeps = Peep.all
    @user = current_user
    erb :'home/index'
  end

  post '/peep/new' do
    peep = Peep.create(message: params[:new_peep_box],
      datetime: Time.now.utc,
      user_id: current_user.id)
    peep.save
    redirect '/home'
  end

  get '/user/new' do
    @new_user = User.new
    erb :'user/new'
  end

  post '/user/add' do
    @new_user = User.create(email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation],
      name: params[:name], user_name: params[:user_name])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect '/home'
    else
      flash.now[:errors] = @new_user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/user' do
    @user = User.last
    erb :'user/user'
  end

  get '/welcome' do
    erb :'home/welcome'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end
end

# p 'HERE!!'
# p current_user.id
# p 'END'
