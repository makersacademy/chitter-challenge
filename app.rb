require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.instance
    @peeps = Peep.feed
    erb :chitter
  end

  post '/' do
    @user = User.instance
    Peep.add(params[:content])
    redirect '/'
  end
  
  get '/sign-up' do
    erb :signup
  end

  post '/new-user' do
    data = [params[:name], params[:handle], params[:password], params[:email]]
    User.check_if_unique(*data)
    redirect '/error' if User.error
    erb :welcome
  end

  get '/error' do
    @error = User.error
    erb :error
  end

  run! if app_file == $0
end
