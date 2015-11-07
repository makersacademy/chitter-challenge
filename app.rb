require 'sinatra/base'
require './model/maker'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_confirmation' do
    @name = session[:name] = params[:name]
    Maker.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    erb :sign_up_confirmation
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
