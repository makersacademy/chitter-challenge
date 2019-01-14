ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './config/data_mapper'

class ChitterApp < Sinatra::Base
  get '/' do
    @messages = Message.all
    erb :index
  end
  post '/post_msg' do
    Message.create(peep: params[:msg])
    redirect '/'
  end


  run! if app_file == $0
end
