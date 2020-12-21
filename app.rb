require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/chitter' do
    'Welcome to Chitter'
    @peep = session[:peep]

    erb :'chitter/index'
  end

  post '/chitter/add' do
    session[:peep] = params[:peep]

    redirect '/chitter'
  end

  run! if app_file == $0
end
