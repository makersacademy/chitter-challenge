require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './models/peep'
require_relative './models/user'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:username] = user.username
      redirect '/peeps'
    else
      redirect '/failure'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      redirect '/login'
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :failure
  end

  get '/peeps' do
    @users = User.all
    @username = session[:username]
    @peeps = Peep.order(created_at: :desc)
    erb :'peeps/index'
  end

  post '/peeps/new' do
    peep = Peep.new(params)
    peep.user = User.find_by(username: session[:username])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
