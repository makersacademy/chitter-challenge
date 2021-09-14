require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './db_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/user/new' do
    erb :sign_up
  end
  
  post '/user/new' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end

  run! if app_file == $0
end
