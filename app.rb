require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require './lib/message'
require './lib/user'
require_relative 'helpers'

class Twittarr < Sinatra::Base
  enable :sessions
  set :session_secret, 'arrgh'
  register Sinatra::Flash

  get '/' do
    erb :landing_page
  end
  
  get '/login' do
    redirect '/dashboard'
  end

  get '/signup' do
    erb :signup
  end
  
  get '/dashboard' do
    @messages = Message.all(:order => [:created_at.desc])
    erb :index
  end

  post '/new' do
    Message.create(:message => params[:tweet], :created_at => Time.now)
    redirect "/dashboard"
  end

  post '/new/user' do
    user = User.create(:email => params[:email], :password => params[:password],:username => params[:username])
    session[:username] = user.username
    redirect '/dashboard'
  end

  helpers helpers 
  run! if app_file == $0
end
