require 'sinatra'
require 'sinatra/activerecord'
require './models/message'
require './models/user'

set :database_file, 'config/database.yml'

class App < Sinatra::Base

  enable :sessions

  get '/' do
    @message = session[:message]
    p @message
    erb :index
  end

  post '/message' do
    session[:message] = params[:message]
    session[:messages]
    redirect '/'
  end

end
