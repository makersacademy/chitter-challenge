require 'sinatra'
require 'pg'
require_relative 'peep_manager'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find[session[:user_id]]
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/peeps/new' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/user/new' do
    erb :'user/registration'
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
