require 'sinatra'
require 'pg'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :new_user
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect ('/peeps')
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peeps.all
    erb :show
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    @peep = Peeps.create(peep: params[:new_peep], time: Time.now)
    redirect ('/peeps')
  end

  run! if app_file == $0
end
