require 'sinatra/base'
require './lib/message.rb'
require './lib/user.rb'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions
    
  get '/' do
    redirect('/messages')
  end

  get '/messages' do
    @list = Message.all
    @user = session[:user]
    #@authors = @messages.each { |message| message.author }
    erb :message_board
  end

  post '/messages/new' do
    @author = session[:user]
    p "AAAAAA"
    p @author
    @messages = Message.create(content: params['content'], time: Time.new, author: @author.username)
    redirect '/messages'
  end

  post '/sign_up/new' do
    @user = User.create(username: params['username'], realname: params['realname'], lastname: params['lastname'])
    redirect '/successfully_signed_up'
  end
  
  get '/sign_up' do
    erb :sign_up
  end

  get '/successfully_signed_up' do
    session[:user] = User.instance
    @user = session[:user]
    erb :successfully_signed_up
  end
  
  post '/login' do
    User.find(username: params['username'])
    session[:user] = User.instance
    p session[:user]
    redirect '/messages'
  end 

  post '/logout' do
    session[:user] = nil
    redirect '/messages'
  end

  run! if app_file == $0
end
