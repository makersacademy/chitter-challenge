require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'
require './spec/database_helpers'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  # get '/' do
  #   erb :index
  # end
  #
  # post '/time' do
  #   flash[:time] = Time.now.strftime("%I:%M:%S")
  #   redirect '/'
  # end

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    erb :chitter
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      email: params['email'],
      password: params['password'],
      name: params['name'],
      username: params['username']
    )
    session[:user_id] = user.id
    redirect '/chitter'
  end

  post '/peeps' do
    Peep.create(
      message: params[:message],
      timestamp: params[:timestamp]
    )
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
