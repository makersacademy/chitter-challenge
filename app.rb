require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
    also_reload 'app.rb'
  end 

  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @message = session[:message]
    erb :chitter
  end

  get '/chitter/new_peep' do
    erb :new_peep
  end

  post '/chitter/new_peep' do
    session[:message] = params[:message]
    redirect '/chitter'
  end

  run! if app_file == $0
end

