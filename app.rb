require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

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
    # user = User.create(email: params['email'], password: params['password'])
    # @user = User.create(email: params[:email], password: params[:password])
    # session[:user_id] = user.id
    users={name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123' }
    redirect '/peeps'
  end


  run! if app_file == $0
end
