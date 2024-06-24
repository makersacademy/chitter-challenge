require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/user'

class Chitterapp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    erb(:home)
  end

  get '/registrations/signup' do
    erb(:signup)
  end

  post '/registrations' do
    puts params
    #@user = User.new(name: params[:fullname], email: params[:email], password: params[:password])
    @user = User.new(name: params[:fullname], email: params[:email], password: params[:password])
    session[:username] = params[:fullname]
    redirect '/stream'
  end

  get '/stream' do
    @peeps = Chitter.all
    @username = session[:username]
    erb(:index)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
    Chitter.create(peep: params[:peep],time: Time.now)
    redirect '/stream'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/sessions/login' do
    erb(:login)
  end
   
  post '/login' do
    session[:username] = params[:username]
    # chitter.check(params[:username])

    redirect '/stream'
  end

  run! if app_file == $0
end