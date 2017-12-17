ENV['RACK_ENV'] ||= 'development'
# ENV['RACK_ENV'] ||= 'test'

require 'sinatra'
require 'sinatra/base'

require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'secretpass'

get '/' do
  @user = session[:user_name]
 erb :index
end

get '/messages' do
  @user = session[:user_name]
  @messages = Message.all(:order => [:created_at.desc])
  erb :'messages/messages'
  end

get '/messages/new' do
  erb :'messages/new_messages'
end

post '/messages/new' do
  message = Message.create(message: params[:message])
  session[:user_name] = params[:user_name]
  redirect '/messages'
end

get '/users/new' do
  @user = User.new
  erb :'users/new_user'
end

post '/users/new' do
session[:user_name] = params[:user_name]
@user = User.create(user_name: params[:user_name],
                    user_email: params[:user_email])
redirect '/'
end

# run if file is run directly by Ruby
run! if app_file == $0

end
