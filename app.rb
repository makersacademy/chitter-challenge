require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
    Peep.save(peep: params[:peep], username: session[:username])
    redirect '/'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/confirm' do
    session[:username] = params[:username]
    if User.already_exists?(username: session[:username])
      redirect '/nameerror'
    else User.save(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    end
    erb(:confirm)
  end

  get '/nameerror' do
    "Sorry, that username is already taken"
  end

  run! if app_file == $0

end
