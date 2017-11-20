ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email],
    password_digest: params[:password],
    name: params[:name])
    user.save
    session[:user_id] = user.id
    @email = params[:email]
    redirect '/new_peep'
  end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  post '/login' do
    redirect '/new_peep'
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/peep_post' do
    peep = Peep.create(subject: params[:Subject], peep: params[:peep_message])
    peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :peeps
  end
  run! if app_file == $0
end
