require 'sinatra'
require 'sinatra/activerecord'
require './models/message'
require './models/user'

set :database_file, 'config/database.yml'

class App < Sinatra::Base

  enable :sessions

  get '/' do
    session[:messages] ||= Array.new
    @messages = session[:messages]
    p @messages
    erb :index
  end

  post '/message' do
    session[:messages] << params[:message]
    p session[:messages]
    redirect '/'
  end

end
