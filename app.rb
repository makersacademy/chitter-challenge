require 'sinatra'
require 'sinatra/flash'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get "/new_peep" do
    erb(:new_peep)
  end

  post "/new_peep" do
    @user = session[:user]
    Peep.add(@user, params[:peep])
    redirect("/feed")
  end

  get "/feed" do
    if session[:user].nil?
      flash[:login_warning] = "You must be logged in to view peeps"
      redirect("/")
    else
      @current_user = session[:user]
      erb(:home)
    end
  end

  get "/" do
    erb(:login_signup)
  end

  get "/signup" do
    erb(:signup)
  end

  post "/logout" do
    session[:user] = nil
    redirect("/")
  end

  get '/login' do
    erb(:login)
  end

  post "/register" do
  User.store(params[:username], params[:password])
  redirect("/login")
  end

  post "/signed_in" do
    if User.valid_user?(params[:username], params[:password])
      session[:user] = params[:username]
      redirect('/feed')
    else 
      flash[:password] = "Incorrect username or password"
      redirect('/login')
    end
  end 


end