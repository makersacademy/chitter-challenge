require 'sinatra/base'
require 'sinatra'
require 'data_mapper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb(:'chitter/index')
  end

  post '/chitter/log' do
    session[:peep] = params[:peep]
    redirect '/chitter/view'
  end

  get '/chitter/view' do
    @peep = session[:peep]
    erb(:'chitter/view')
  end

  run! if app_file == $0
end
