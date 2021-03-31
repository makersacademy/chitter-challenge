require "sinatra/base"
require "sinatra/flash"
require "./lib/peep"
require "./lib/user"
require "pg"

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get "/" do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post "/posted" do
    Peep.create(message: params["posted_message"])
    redirect("/")
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect("/")
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    flash[:notice] = 'You have signed out.'
    session.clear
    redirect('/')
  end

  run! if app_file == $0
end