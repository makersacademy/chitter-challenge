require 'sinatra/base'
require './model/maker'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_confirmation' do
    Maker.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    erb :sign_up_confirmation
  end

  post '/home' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect to('/home')
  end

  get '/home' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
