ENV['RACK_ENV'] ||= 'development'
# ENV['RACK_ENV'] ||= 'test'

require 'sinatra'
require 'sinatra/base'
require_relative 'models/message.rb'


class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'secretpass'

get '/' do
 erb :index
end

get '/messages' do
  @user = session[:user]
  @message = session[:message]
  erb :'messages/messages'
  end

get '/messages/new' do
  erb :'messages/new_messages'
end

post '/messages/new' do
  message = Message.create(message: params[:message])
  session[:user] = params[:user_name]
  session[:message] = message.message
  redirect '/messages'
end


# run if file is run directly by Ruby
run! if app_file == $0

end
