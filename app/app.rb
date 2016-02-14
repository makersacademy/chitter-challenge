ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './dm_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    User.create(username: params[:username], password: params[:password])
    session[:current_user] = params[:username]
    redirect('/')
  end

  get '/' do
    @username = session[:current_user] || 'friend'
    erb(:index)
  end

  run! if app_file == $0
end