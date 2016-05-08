ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  include Helpers

  enable :sessions
  set    :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/signup' do
    @peeps = Peep.all
    erb :signup
  end

  get '/login' do
    erb :login
  end

  post '/welcomesignup' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    user.save
    redirect '/feed'
  end

  post '/welcomelogin' do
    user = User.first(params[:returning_username])
    session[:user_id] = user.id
    redirect '/feed'
  end

  get '/feed' do
    @user = current_user
    @peeps = Peep.all
    p @user
    erb :feed
  end

  post '/feed' do
    peep = Peep.create(user_id: 1, content: params[:content], time: Time.new)
    current_user.peeps << peep
    peep.save
    current_user.save
    redirect '/feed'
  end

  post '/logout' do
    @current_user = nil
    p @current_user
    redirect '/feed'
  end

  run! if app_file == $PROGRAM_NAME
end
