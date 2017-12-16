ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require './lib/chat.rb'
require 'sinatra/flash'
require './lib/userhandler.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/chat' do
    @msgs = Chat.new.msgs
    erb :chat
  end

  post '/chat' do
    Chat.new.create_msg(params[:message], current_user)
    redirect '/chat'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = UserHandler.new.create_user(params)
    session[:user_id] = user.id if user.valid?
    flash[:errors] = user.errors.values.flatten
    flash[:email] = user.email
    flash[:name] = user.name
    redirect(user.valid? ? '/chat' : '/signup')
  end

  run! if app_file == $0
end
