require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/signup' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:name] = params[:name]
    session[:username] = params[:username]
    redirect 'signup/confirmation'
  end

  get '/signup/confirmation' do
    @name = session[:name]
    erb :confirmation
  end

# post '/users' do
#   # create the user and then...
#   redirect '/bookmarks'
# end

  run! if app_file == $0
end
