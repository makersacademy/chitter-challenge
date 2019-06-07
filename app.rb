require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/register' do
    erb :index
  end

  post '/chitter' do
    @name = params[:name]
    @user_name = params[:user_name]
    @email_address = params[:email_address]
    erb :chitter
  end

run! if app_file == $0
end