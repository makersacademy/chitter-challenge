require 'sinatra/base'
require './lib/peeper.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  get '/chitter/login' do
    erb :"chitter/login"
  end

  post '/chitter/enter' do
    session[:email] = params['email']
    session[:password] = params['password']
    redirect '/chitter/timeline'
  end

  get '/chitter/timeline' do
    erb :"chitter/timeline"
  end

  get '/chitter/peep' do
    erb :"chitter/peep"
  end
  run! if app_file == $0
end
