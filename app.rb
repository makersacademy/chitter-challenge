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
   
    Peep.add(params[:peep])
    redirect("/feed")
  end

  get "/feed" do
    @current_user = session[:user]
    puts session[:user]
    erb(:home)
  end

  get "/" do
    erb(:login_signup)
  end

  get "/signup" do
    erb(:signup)
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