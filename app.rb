require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './spec/setup_connection'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user])
    @peeps = Peep.all
    @signup = params[:signup]
    erb :index, :layout => :base
  end

  get '/user/new' do
    @user = User.find(id: session[:user])
    if @user
      flash[:notice] = "Please log out first"
      redirect('/')
    end
    erb :'user/new', :layout => :base
  end

  get '/user/login' do
    @user = User.find(id: session[:user])
    if @user
      flash[:notice] = "Already logged in as #{@user.username}"
      redirect('/')
    end
    erb :'user/login', :layout => :base
  end

  post '/user/login' do
    user = User.account(email: params[:email])
    if user # don't need an instance variable as we aren't presenting anything
      if User.valid_password?(id: user.id, password: params[:password])
        session[:user] = user.id
        flash[:notice] = "Successfully logged in as #{user.username}"
        redirect('/')
      else
        flash[:notice] = "Please check your password is correct"
        redirect('/user/login')
      end
    else
      flash[:notice] = "An account with that email doesn't exist"
      redirect('/user/login')
    end
  end

  get '/user/logout' do
    user = User.find(id: session[:user])
    if user
      session.clear
      flash[:notice] = 'You have logged out'
      redirect('/')
    else
      flash[:notice] = "You are not logged in"
      redirect('/user/login')
    end
  end

  post '/user' do
    if User.unique?(username: params[:username], email: params[:email]) # how do I refactor this
      @user = User.create(username: params[:username], email: params[:email],
      first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      session[:user] = @user.id # signing up logs you in
      redirect("/?signup=true")
    else
      flash[:notice] = "That username or email already exists"
      redirect('/user/new')
    end
  end

  # halt erb(:error) for later use

  post '/peep/new' do
    user = User.find(id: session[:user])
    if user
      if params[:peep_text].length > 280
        flash[:notice] = "That peep is too long!"
        session[:peep] = params[:peep_text] # to keep the tweet in the form
        redirect('/')
      end
      Peep.create(text: params[:peep_text], author: user.id)
      session[:peep] = nil
    else
      flash[:notice] = "You are not logged in"
    end
    redirect('/')
  end

  post '/peep/new/:id' do # replying to a tweet of this id
    user = User.find(id: session[:user])
    if user
      if params[:peep_text].length > 280
        flash[:notice] = "That peep is too long!"
        session[:peep] = params[:peep_text] # to keep the tweet in the form
        redirect("/peep/#{params[:id]}")
      end
      Peep.create(text: params[:peep_text], author: user.id, peep: params[:id])
      session[:peep] = nil
      redirect("/peep/#{params[:id]}")
    else # might be unnecessary
      flash[:notice] = "You are not logged in"
      redirect("/")
    end
  end

  get '/peep/:id' do
    @peep = Peep.find(id: params[:id])
    @replies = Peep.replies(id: params[:id])
    @user = User.find(id: session[:user])
    erb :reply, :layout => :base
  end

  run! if app_file == $0
end
