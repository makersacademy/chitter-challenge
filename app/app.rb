ENV['RACK_ENV'] ||= 'development'

require_relative 'app_helpers'
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'time'

class Chitter < Sinatra::Base
  enable :sessions
  enable :secret_sessions, 'secret'

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
    erb :'user/new'
  end

  post '/user/add' do
    new_user = User.create(email: params[:email], password: params[:password],
      name: params[:name], user_name: params[:user_name])
    session[:user_id] = new_user.id
    redirect '/home'
  end

  get '/user' do
    @user = User.last
    erb :'user/user'
  end

  get '/welcome' do
    erb :'home/welcome'
  end
end

# p 'HERE!!'
# p current_user.id
# p 'END'
