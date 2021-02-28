ENV['RACK_ENV'] ||= 'development'

require 'pg'
require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    # session[:username] = params[:username]
    @user = User.new(params[:name], params[:last_name], params[:username], params[:email], params[:password])
    redirect "/feed/#{@user.username}"
  end

  get '/feed/:username' do
    @username = params[:username]
    @chitter = Chitter.list
    erb :feed
  end

  post '/feed/:username' do
    # p params
    @username = params[:username]
    Chitter.create(@username, params[:content])
    redirect "/feed/#{@username}"
  end

  run! if app_file == $0
end
