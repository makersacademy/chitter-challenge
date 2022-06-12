require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './lib/account'
require 'pg'

# application_controller 
class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  
  get '/' do
    'Chitter'
  end

  get '/chitter' do # LIST data
    @peeps = Peeps.all
    erb :index
  end

# peeps_controller

  get '/chitter/peeps/new' do
    erb :'peeps/new'
  end 

  post '/chitter/peeps' do
    Peeps.create(message: params[:message])
    redirect '/chitter' 
  end 

# accounts_controller
  get '/chitter/signup' do 
    erb :'/accounts/signup'
  end 

  post '/chitter/newaccount' do # CREATE data
    Account.create(name: params[:full_name], username: params[:username], 
                    email: params[:email], password: params[:password])
    session[:success_message] = "You've successfully signed up to chitter!"
    redirect '/chitter/member'
  end 

  get '/chitter/member' do # home page for someone who has just signed up
    @peeps = Peeps.all
    @success_message = session[:success_message]
    erb :index
  end 

  run! if app_file == $0
end
