ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'bcrypt'

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'notsosecret'


  get '/' do
    erb :home
  end

  post '/sign_in' do
    password = BCrypt::Password.create(params[:password])
    user = Users.create(username: params[:username], email: params[:email], password: password.to_s)
    session[:user_id] = user.id
    redirect to('/home')
  end

  # post '/home' do
  #     user = Users.get(session[:user_id])
  #     redirect to('/home')
  # end

  get '/home' do
    user = Users.get(session[:user_id])
    # @peeps = Peep.all(users_id: user.id) || []
    @peeps = Peep.all() || []
    @username = user.username
    @user_id = user.id
    erb :index
  end

  get '/post' do
    erb :peep
  end

  post '/post' do
    user = Users.get(session[:user_id])
    time = Time.now
    peep = Peep.create(content: params[:content],time_posted: time, users_id: user.id)
    redirect to('/home')
  end

run! if app_file == $0
end
