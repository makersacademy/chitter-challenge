ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './config/data_mapper'
require 'pry'
require './lib/user'
class ChitterApp < Sinatra::Base
  enable :sessions
  get '/' do
    @messages = Message.all
    session[:username] ||= 'unknown'
    @username = session[:username]
    if @username == 'unknown'
      erb :index
    else
      erb :logged_in
    end
  end
  post '/post_msg' do
    Message.create(peep: params[:msg], username: session[:username])
    redirect '/'
  end
  get '/signup' do
    erb :signup
  end
  post '/signup' do
    User.create(username: params[:username], mail: params[:mail], password: params[:password])
    session[:username] = params[:username]
    redirect '/logged_in'
  end
  get '/logged_in' do
    @messages = Message.all
    @username = session[:username]
    erb :logged_in
  end

  run! if app_file == $0
end
