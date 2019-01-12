ENV["RACK_ENV"] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'
require './lib/user'
require './lib/peep'


set :database_file, "config/database.yml"

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:id] = user.id
    redirect "/profile/#{session[:id]}"
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
    @user = User.find(params[:id])
    @peeps = Peep.all
    erb :profile
  end

  post '/peep/:id' do
    user = User.find(params[:id])
    peep = Peep.create(user_id: user.id, content: params[:content], created_at: Time.now)
    redirect "/profile/#{params[:id]}"
  end

end