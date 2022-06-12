require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './lib/account'
require 'pg'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/chitter' do # LIST data
    @peeps = Peeps.all
    erb :index
  end 

  get '/chitter/signup' do 
    erb :sign_up
  end 

  post '/chitter' do # CREATE data
    p params 
    Account.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    # @username = params[:username]
    # p @username
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