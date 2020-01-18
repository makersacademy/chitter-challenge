require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base
  enable :sessions
  
  get '/' do
    @user = session[:name]
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    session[:name] = params[:name]
    redirect '/'
  end

end