require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Welcome to Chitter'
  end

  get '/chitter/home' do
    @newpeep = session[:newpeep]
    erb(:index)
  end

  post'/chitter/peep' do
    session[:newpeep] = params[:newpeep]
    redirect '/chitter/home'
  end

end
