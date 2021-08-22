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

  post '/welcome' do
    data = [params[:name], params[:handle], params[:password], params[:email]]
    # need to call a checker here so that duplicate handles/emails do not create a new user 
    User.create(*data)
    erb :welcome
  end

  run! if app_file == $0
end
