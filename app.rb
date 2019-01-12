require 'sinatra'
require 'sinatra/activerecord'
require './models/message'
require './models/user'

set :database_file, 'config/database.yml'

class App < Sinatra::Base

  enable :sessions
  enable :method_override


  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/message' do
    @message = Message.create({:content => params[:message]})
    redirect '/'
  end

end
