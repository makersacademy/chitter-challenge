require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions 
 # look up session_secret

  get '/' do
    erb :landing
  end

  get '/log-in' do
    erb :login
  end

  get '/sign-up' do
    erb :sign_up
  end

  get '/home' do
    erb :home
  end

  post 'home' do
    redirect '/home'
  end
end
