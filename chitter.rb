require 'sinatra/base'
# This is the model require_relative './lib/list.rb'
require 'pg'
require './lib/users.rb'
require './lib/peeps.rb'
require_relative "./database_environment.rb"

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @incorrect_details = session[:incorrect_details]
    erb(:login)
  end

  post '/login' do
    unless User.authenticate(params[:username], params[:password])
      session[:incorrect_details] = "Incorrect username or password"
      redirect('/')
    end
    session[:user] = User.authenticate(params[:username], params[:password])
    redirect('/peeps')
  end

  get '/register' do
    @user_taken = session[:already_taken]
    erb(:register)
  end

  post '/register' do
    if User.already_exists?(params[:username])
      session[:already_taken] = "User name already taken"
      redirect('/register')
    end
    session[:user] = User.create(params[:username], params[:password])
    redirect('/peeps')
  end

  get '/peeps' do
    @user = session[:user]
    @peeps = Peep.all
    if session[:peeps] == 'reverse'
      @peeps = Peep.reverse_time_peeps
    end
    erb(:peeps)
  end

  post '/peeps/reverse' do
    session[:peeps] = 'reverse'
    redirect('/peeps')
  end

  post '/peeps/chronological' do
    session[:peeps] = 'chronological'
    redirect('/peeps')
  end

  get '/peeps/add' do
    erb(:add)
  end

  post '/peeps/add' do
    @user = session[:user]
    Peep.create(params[:body], @user.username)
    redirect('/peeps')
  end

  get '/signout' do
    sessions.clear
    redirect('/')
  end

  run! if app_file == $0
end
