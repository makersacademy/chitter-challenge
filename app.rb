require 'sinatra/base'
require './lib/chitter.rb'
class Chitter < Sinatra::Base

  enable :sessions  #Enables use of session[:hash] for storing data

  get '/' do
    erb :"chitter/index"
  end

  post '/' do
    @user_name = params[:user_name].capitalize
    redirect '/home'
  end

  post '/home' do
    @user_name = params[:user_name].capitalize
    erb :"chitter/home"
  end

end
