require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    @user = session[:user]
    erb :signup
  end

  get '/peeps' do
    @user = session[:user]
    @unsorted = Peep.all
    @peeps = @unsorted.sort {|a,b| b.date <=> a.date}
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/add-peep' do
    @user = session[:user]
    date = Time.now
    Peep.create(username: @user.username, content: params[:content], date: date)
    redirect '/peeps'
  end

  post '/new-user' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    session[:user] = @user
    redirect "/peeps"
  end

  get '/log-out' do
    session[:user] = nil
    redirect '/'
  end

  post '/log-in' do
    user = User.login(username: params[:username], password: params[:password])
    if user
      session[:user] = user
      redirect '/peeps'
    else
      flash[:notice] = "Wrong email and/or password"
      redirect '/'
    end
  end

end
