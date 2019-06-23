require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :homepage
  end

  post '/signup' do
    @email = params[:email]
    @password = params[:password]
    @name = params[:name]
    @username = params[:username]
    erb :signup
  end

post '/users' do
  # create the user and then...
  redirect '/bookmarks'
end

  run! if app_file == $0
end
