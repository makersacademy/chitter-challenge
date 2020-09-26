require 'sinatra/base'
require_relative './lib/chitter'
require_relative './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect 'tweets'
  end

  get '/tweets' do
    @tweets = Chitter.show
    @current_user = session[:current_user]
    erb :index
  end

  get '/tweets/add' do
   p Chitter.add(tweet: params[:tweet]) 
   p params[:tweet] 
   redirect '/tweets'
  end

  get '/user' do
    erb :signup
  end

  post '/user/signin' do
    temp_user = User.find(username: params[:username], password: params[:password]) 
    session[:current_user] = temp_user if params[:password] == temp_user.password
    
     
     redirect '/tweets'
  end

  post '/user/add' do
    User.add(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    redirect '/tweets'
  end

  run! if app_file == $0
end