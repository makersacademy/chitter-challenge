require "sinatra/base"
require "./lib/peep"
require "./lib/user"
require "pg"

class Chitter < Sinatra::Base

  enable :sessions, :method_override

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
    p user.id
    session[:user_id] = user.id
    p session[:user_id]
    redirect("/")
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  run! if app_file == $0
end