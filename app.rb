require 'sinatra/base'
require './data_mapper_setup'
require './lib/message'
require './lib/user'

class Twittarr < Sinatra::Base
  enable :sessions
  set :session_secret, 'arrgh'

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
    @username = session[:username]
    @messages = Message.all(:order => [:created_at.desc])
    erb :index
  end

  post '/new' do
    Message.create(:message => params[:tweet], :created_at => Time.now)
    redirect "/dashboard"
  end

  post '/new/user' do
    User.create(:email => params[:email], :password => params[:password],:username => params[:username])
    session[:username] = params[:username]
    redirect '/dashboard'
  end

  run! if app_file == $0
end
