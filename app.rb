require 'sinatra/base'
require 'sinatra/activerecord'
require './lib/user'
require './lib/peep'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do 
    # @peeps = Peep.all
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create({ firstname: params[:firstname], surname: params[:surname], username: params[:username], email: params[:email], password: params[:password] })
    session[:id] = user.id
    redirect '/signin'
  end

  get '/signin' do
    erb(:signin)
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:id] = user.id 
      redirect("/profile/#{session[:id]}")
    else
      # CAN CREATE LATER 
      redirect '/error'
    end
  end

  get '/profile/:id' do
    @user = User.find(params[:id])
    @users = User.all
    @peeps = Peep.all
    erb(:profile)
  end

  get '/peep/:id' do
    @user = User.find(params[:id])
    erb(:peep)
  end

  post '/peep/:id' do
    @user = User.find(params[:id])
    peep = Peep.create({ user_id: @user.id, title: params[:title], content: params[:content] })
    redirect("profile/#{@user.id}")
  end

  delete '/sessions' do
    session.delete(:id)
    redirect '/'
  end

end
