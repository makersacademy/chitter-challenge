require 'sinatra/base'
require './data_mapper_setup'
require './lib/message'

class Twittarr < Sinatra::Base
  enable :sessions
  set :session_secret, 'arrrrgh'

  get '/' do
    erb :landing_page
  end
  
  get '/login' do
    redirect '/dashboard'
  end
  
  get '/dashboard' do
    @messages = Message.all(:order => [:created_at.desc])
    erb :index
  end

  post '/new/tweet' do
    @tweet = params[:tweet]
    "hello #{@tweet}"
  end

  run! if app_file == $0
end
