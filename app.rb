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
    @user = User.find(id: session[:user]) if session[:user]
    @peeps = Peep.all
    @signup = params[:signup]
    erb :index, :layout => :base
  end

  get '/user/new' do
    erb :'user/new', :layout => :base
  end

  get '/user/login' do
    erb :'user/login', :layout => :base
  end

  post '/user/login' do
    user = User.account(email: params[:email])
    if user
      if User.valid_password?(id: user.id, password: params[:password])
        session[:user_id] = user.id
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

  post '/user' do
    if User.unique?(username: params[:username], email: params[:email]) # how do I refactor this
      @user = User.create(username: params[:username], email: params[:email],
      first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      session[:user] = @user.id
      redirect("/?signup=true")
    else
      flash[:notice] = "That username or email already exists"
      redirect('/user/new')
    end
  end

  #halt erb(:error) for later use

  post '/peep/new' do
    text = params[:peep_text]
    Peep.create(text: text)
    redirect('/')
  end

  run! if app_file == $0
end
