ENV["RACK_ENV"] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'
require './lib/user'
require './lib/peep'

set :database_file, "config/database.yml"

class Chitter < Sinatra::Base
  enable :sessions
  set :method_override, true

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], 
    name: params[:name], username: params[:username])
    if user.valid?
      session[:id] = user.id
      redirect "/profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:id] = user.id
      redirect "/profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  get '/profile/:id' do
    if signed_in?
      @user = User.find(params[:id])
      @peeps = Peep.all
      erb :profile  
    else
      redirect '/'
    end
  end

  post '/peep/:id' do
    user = User.find(params[:id])
    Peep.create(user_id: user.id, content: params[:content], 
    created_at: Time.now)
    redirect "/profile/#{params[:id]}"
  end

  delete '/sessions' do
    session.delete(:id)
    redirect '/'
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

end
