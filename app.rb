require 'sinatra/base'
# require './lib/bookmark.rb'
require 'pg'

class Chitter < Sinatra::Base
  # enable :sessions
  # set :session_secret, ENV['SESSION_SECRET']

  get '/' do
      erb :index
  end

  get '/home' do
      erb :home
  end

  post '/home' do
    Details.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username] )
    redirect '/home'
  end
  
  get '/signup' do
      erb :signup
  end

  run! if app_file == $0
end
