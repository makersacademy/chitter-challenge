require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/maker'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get "/" do
    erb :'index'
  end

  get "/peeps" do
    @maker = Maker.find(id: session[:maker_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    Peep.create(content: params[:content], maker_id: session[:maker_id])
    redirect "/peeps"
  end

  get "/makers/new" do
    erb :"makers/new"
  end

  post "/makers" do
    maker = Maker.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
      )
    if maker
      session[:maker_id] = maker.id
      redirect "/peeps"
    else
      flash[:notice] = "Email or username already registered"
      redirect "/makers/new"
    end
  end

  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    maker = Maker.authenticate(email: params[:email], password: params[:password])
    if maker
      session[:maker_id] = maker.id
      redirect "/peeps"
    else
      flash[:notice] = "Incorrect email or password"
      redirect "/sessions/new"
    end
  end

  get "/sessions/destroy" do
    session.clear
    flash[:notice] = "You have signed out"
    redirect "/"
  end

  post "/sessions/destroy" do
    session.clear
    flash[:notice] = "You have signed out"
    redirect "/"
  end

  run! if app_file == $0
end
