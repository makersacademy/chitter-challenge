require "sinatra/base"
require "./lib/chitter"
require "./lib/signup"
require "./lib/login"
require "./dbc_setup"
require "sinatra/flash"

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  get "/" do
    @user = Login.find(username: session[:username])
    @posts = Chitter.all
    erb :chitter
  end
  post "/post" do
    Chitter.create(post: params[:post], date: Time.new.strftime("%A, %d/%b/%y at %I:%M %p"), username: params[:username])
    redirect "/"
  end

  # Login
  get "/login" do
    erb :login
  end
  post "/login" do
    user = Login.authenticate(email: params[:email], password: params[:password])
    if user
      session[:username] = user.username
      redirect("/")
    else
      flash[:notice] = "Please check your email or password."
      redirect("/login")
    end
  end

  # logout
  post "/logout" do
    session.clear
    redirect "/"
  end

  # Sign up
  get "/signup" do
    erb :signup
  end
  post "/signup" do
    registered = Signup.create(username: params[:username], name: params[:name], lastname: params[:lastname], email: params[:email], password: params[:password])

    if registered
      flash[:account] = "Account successfully created, please login with you new details"
      redirect("/login")
    else
      flash[:username] = "User or email already taken"
      redirect("/signup")
    end
  end
end
