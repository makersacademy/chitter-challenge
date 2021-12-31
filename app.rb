require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'homepage'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users/new' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    # session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = { email: 'hagrid@mail.com', password: 'hagrid123' }
    redirect '/peeps'
  end


  run! if app_file == $0
end
