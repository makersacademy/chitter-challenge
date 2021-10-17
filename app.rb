require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection.rb'
require_relative './db_connect_at_start.rb'
require_relative "./lib/peep.rb"
require_relative "./lib/user.rb"

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    
    @peeps = Peep.all
    @user = User.find(id: session[:user_id]) 
    puts "Theres a user #{@user} " if @user
    erb :main_page
    
  end

  post '/peep' do 
    Peep.create(content: params[:content])
    redirect "/"
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password] )
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end