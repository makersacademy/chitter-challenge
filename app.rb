require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'
require './database_connection_setup'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  get '/peeps' do
    @peeps = Peep.all
    erb(:"peeps/index")
  end
  
  get '/peeps/new' do
    erb(:"peeps/new")
  end
  
  post '/peeps' do
    Peep.create(text: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    session[:name] = params[:name]
    flash[:notice] = "Signed in as #{session[:name]}" if session[:name]
    redirect '/'
  end

  run! if app_file == $0
end
