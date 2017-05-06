ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect('/signup')
  end

  post '/signup' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/signup' do
    erb(:signup)
  end

  get '/home' do
    'Chitter!'
  end

end
