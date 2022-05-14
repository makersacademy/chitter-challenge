require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/message'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end



  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/new' do
    erb :new_message
  end

  post '/new' do
    Message.post(body: params[:body], name: params[:name], username: params[:username])
    redirect '/'
  end
  
  run! if app_file == $0
end