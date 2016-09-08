ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super_secret'
  register Sinatra::Flash

  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @user_name = session[:user_name]
    erb(:feed)
  end

  get '/user/sign_up' do
    erb(:'user/sign_up')
  end

  post '/user/sign_up' do
    user = User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    if user.save
      session[:user_name] = user.user_name
      redirect '/'
    else
      flash[:error] = user.errors.full_messages
      redirect '/user/sign_up'
    end
  end

  get '/user/sign_in' do
    erb(:'user/sign_in')
  end

  post '/user/sign_in' do
    # add method to authenticate user
    if user
      session[:user_name] = user.name
      redirect '/feed'
    else
      flash[:login_failed] = "Invalid email or password. Try again!"
      redirect '/sign_in'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
