require 'sinatra/base'
require './database_connection_setup.rb'
require './lib/user'

class ChitterController < Sinatra::Base
  get '/' do
    erb(:login_page)
  end

  get '/create-account' do
    erb(:register)
  end

  post '/create-account' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect('/')
  end

  run! if app_file == $0
end