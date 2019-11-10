require './lib/peeper'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :splash
  end
  
  get '/register' do
    erb :register
  end

  post '/registration' do
    @peeper = Peeper.create(name: params[:name], email: params[:email], password: params[:password])
    erb :home
  end

  get '/log_in' do
    erb :log_in
  end

  post '/logged_in' do
    @peeper = Peeper.retrieve(name: params[:name], password: params[:password])
    redirect '/log_in' if @peeper.nil?

    erb :home
  end

  run! if app_file == $0
end
