ENV['RACK_ENV'] ||= 'development'

require 'pry'
require 'sinatra/base'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(message: params[:message])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:email] = params[:email]
    User.create(email: params[:email], password: params[:password], username: params[:usermame])
    redirect '/profile'
  end

  get '/profile' do
    @user = User.get(email: session[:email])
    erb :profile
  end

  get '/login' do
    erb :login
  end

end  
