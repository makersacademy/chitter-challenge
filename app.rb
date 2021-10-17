require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection.rb'
require_relative './db_connect_at_start.rb'
require_relative "./lib/peep.rb"

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    
    @peeps = Peep.all
    @users = User.all 
    erb :main_page
  end

  post '/peep' do 
    Peep.create(content: params[:content])
    redirect "/"
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    User.create(email: params[:email], username: params[:username], password: params[:password] )
    redirect '/'
  end
  run! if app_file == $0
end