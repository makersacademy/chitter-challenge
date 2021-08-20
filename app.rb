require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end
  
  post '/add_peep' do
    Peep.add(params[:peep], params[:user])
    redirect '/'
  end 

  get '/signup' do
    erb :signup
  end

  post '/add_user' do
    User.add(params[:name], params[:username], params[:email], params[:password])
    redirect '/'
  end

  run! if app_file == $0
end
