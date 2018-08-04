require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/username' do
    session[:username] = params[:username]
    redirect ('/user')
  end

  get '/user' do
    @username = session[:username]
    erb(:user)
  end

  run! if app_file == $0
end
